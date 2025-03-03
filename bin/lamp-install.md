#!/bin/bash

# Replace needrestart actions to "auto" for 22.04-LTS
# See https://stackoverflow.com/a/73397970
sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
# See https://askubuntu.com/a/1424249
sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf


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
sudo apt-get install zip unzip php-bcmath php-gd php-xml php-curl php-mbstring php-zip php-intl  -y
sudo apt-get install libapache2-mod-php -y

# Reset MySQL root password
echo "Reset MySQL password"
# mysql -u root -e "CREATE DATABASE `$DB_NAME`"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$DB_PASSWORD';"

echo "Configure Apache Vhost"

# configuration of default vhost file
cat <<END >/etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
    #ServerName www.example.com

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    Alias /db /usr/share/phpmyadmin

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    <Directory />
        Order allow,deny
        Allow from 127.0.0.1
    </Directory>
</VirtualHost>
END

#Create a copy of the default Apache configuration file for your site:
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$WEBSITE.conf

# configuration of vhost file
cat <<END >/etc/apache2/sites-available/$WEBSITE.conf
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

# Add Mutex
echo "Mutex flock" >> /etc/apache2/apache2.conf

# Replace user
sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=$SSUSER/g" /etc/apache2/envvars
sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=$SSUSER/g" /etc/apache2/envvars

systemctl reload apache2
systemctl restart apache2

# Configure PHP
echo "Install PHP packages"
apt-get install zip unzip php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-bcmath php-gd php-mysql php-mbstring php-xml php-intl -y --allow-unauthenticated

# Configure Node
echo "Install node and yarn"
curl -sL https://deb.nodesource.com/setup_22.x | bash -
sudo apt-get install -y nodejs
npm i corepack -g

sudo -u apache corepack install yarn@4 -g

sudo -u apache cat <<END > /home/apache/.yarnrc.yml
enableMessageNames: false
nodeLinker: node-modules
END

sudo -u apache echo -e 'export COREPACK_ENABLE_AUTO_PIN=0\n' >> /home/apache/.bashrc


# Configure phpmyadmin
echo "Install and configure phpmyadmin"
DEBIAN_FRONTEND=noninteractive apt install phpmyadmin -yq

# Configure Composer
echo "Install Composer"
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
mv composer.phar /usr/local/bin/composer

echo "Install Complete!"
