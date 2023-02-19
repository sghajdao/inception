chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
    mkdir -p /var/www/html
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --path=/var/www/html --allow-root
    wp core config --path=/var/www/html --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root --skip-check
    wp core install --path=/var/www/html --url=${DOMAIN_NAME} --title="INCEPTION" --admin_user=${ADMIN_WP_USER} --admin_password=${ADMIN_WP_PASSWORD} --admin_email=${ADMIN_WP_EMAIL} --allow-root
    # create user
    wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --path=/var/www/html --allow-root
fi

exec "$@"