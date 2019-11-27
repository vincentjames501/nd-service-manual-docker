#!/bin/bash

echo "Setting Environment Variables"
source .env

echo "Enabling PHP PDO Support."
docker-compose exec php docker-php-ext-install pdo_mysql
docker-compose exec php docker-php-ext-enable pdo_mysql

echo "Restarting PHP Container"
docker-compose restart php

echo "Importing Mazda Database"
cat ./resources/dump.sql | docker-compose exec -T mysql mysql -umazd -p"$DB_PASSWORD"

echo "Updating DB Connection Config Information"
cat <<EOF > ./public_html/config.php
<?php

\$searchdir = './search/documents/*';

\$database = new medoo([
    'database_type' => 'mysql',
    'database_name' => '$DB_NAME',
    'server' => 'mysql',
    'port' => 3306,
    'username' => '$DB_USERNAME',
    'password' => '$DB_PASSWORD',
    'charset' => 'utf8'
]);

?>
EOF
