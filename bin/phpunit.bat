@ECHO OFF
SET BIN_TARGET=%~dp0/../php/phpunit/phpunit/composer/bin/phpunit
php "%BIN_TARGET%" %*
