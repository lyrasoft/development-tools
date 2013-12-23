@ECHO OFF
SET BIN_TARGET=%~dp0/../php/squizlabs/php_codesniffer/scripts/phpcs
php "%BIN_TARGET%" %*
