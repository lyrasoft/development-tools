#!/bin/bash

NODE_VERSION=24

PHP_MAX_EXECUTION_TIME=60
PHP_MEMORY_LIMIT=512M
PHP_UPLOAD_MAX_SIZE=50M
PHP_POST_MAX_SIZR=50M

# Create User
echo "Create user"
adduser $SSUSER --disabled-password --gecos "" && \
echo "$SSUSER:$SSPASSWORD" | chpasswd
adduser $SSUSER sudo

# SET HOSTNAME   
echo "Set Hostname"
hostnamectl set-hostname $HOSTNAME
echo "127.0.0.1   $HOSTNAME" >> /etc/hosts

# Update
echo "APT update"
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:ondrej/apache2 -y # Apache 2.4.60 up - Can be remove in the future
sudo apt-get update

# Basic Packages
sudo apt-get install htop -y

# Install LAMP
echo "Install LAMP"
sudo apt-get install lamp-server^ -y
sudo apt-get install zip unzip php-pear php-fpm php-dev php-zip php-curl php-bcmath php-gd php-mysql php-mbstring php-xml php-intl -y
sudo apt-get install libapache2-mod-php -y

# Configure PHP
echo "Configure php.ini"
PHP_VER=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;") && \
INI="/etc/php/$PHP_VER/apache2/php.ini" && \
sudo sed -i \
-e "s/^max_execution_time.*/max_execution_time = $PHP_MAX_EXECUTION_TIME/" \
-e "s/^memory_limit.*/memory_limit = $PHP_MEMORY_LIMIT/" \
-e "s/^upload_max_filesize.*/upload_max_filesize = $PHP_UPLOAD_MAX_SIZE/" \
-e "s/^post_max_size.*/post_max_size = $PHP_POST_MAX_SIZR/" \
"$INI"

# Reset MySQL root password
echo "Reset MySQL password"
# mysql -u root -e "CREATE DATABASE `$DB_NAME`"
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$DB_PASSWORD';"

echo "Configure Apache Vhost"

# configuration of default vhost file
sudo cat <<END >/etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    <Directory />
        Order allow,deny
        Allow from 127.0.0.1
    </Directory>
</VirtualHost>
<VirtualHost *:443>
    DocumentRoot /var/www/html

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    SSLEngine on
    SSLCertificateFile     /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile  /etc/ssl/private/ssl-cert-snakeoil.key
    <Directory />
        Order allow,deny
        Allow from 127.0.0.1
    </Directory>
</VirtualHost>
END

#Create a copy of the default Apache configuration file for your site:
# cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$WEBSITE.conf

# configuration of vhost file
sudo cat <<END >/etc/apache2/sites-available/$WEBSITE.conf
<Directory /var/www/$HOSTNAME>
    Require all granted
    AllowOverride All
</Directory>
<VirtualHost *:80>
        ServerName $WEBSITE
        ServerAlias www.$WEBSITE
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/$HOSTNAME
        
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
END

mkdir -p /var/www/$HOSTNAME
echo "<h1>LYRASOFT LAMP Ubuntu installed.<h1/></html>" > index.html
sudo chown -R $SSUSER:$SSUSER /var/www

sudo a2ensite $WEBSITE.conf
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod ssl

# Add Mutex
echo "Mutex flock" >> /etc/apache2/apache2.conf

# Replace user
sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=$SSUSER/g" /etc/apache2/envvars
sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=$SSUSER/g" /etc/apache2/envvars

systemctl reload apache2
systemctl restart apache2

# Configure Node
echo "Install node and yarn"
curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash -
sudo apt-get install -y nodejs
npm i corepack -g

sudo -u apache corepack install yarn@4 -g

sudo -u apache cat <<END > /home/apache/.yarnrc.yml
enableMessageNames: false
nodeLinker: node-modules
END

sudo -u apache echo -e 'export COREPACK_ENABLE_AUTO_PIN=0\n' >> /home/apache/.bashrc

# Swap
echo "Create Swap"
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile   none swap    sw 0 0" >> /etc/fstab

# Configure Composer
echo "Install Composer"
sudo wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
sudo mv composer.phar /usr/local/bin/composer

echo "Install LYRA CLI for apache user"
sudo -u apache -H bash -c 'curl -fsSL https://raw.githubusercontent.com/lyrasoft/lyra-cli/master/resources/installer/lyra-cli-installer.php | php'

echo "Install Complete!"
