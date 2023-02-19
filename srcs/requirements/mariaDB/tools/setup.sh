#!/bin/bash
service mysql start


echo "CREATE USER IF NOT EXISTS $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON * . * TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root -p$MYSQL_ROOT_PASSWORD

# echo "CREATE IF NOT EXISTS DATABASE ${MYSQL_DATABASE};" | mysql -u root
# echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
# echo "GRANT ALL PRIVILEGES ON ${MYSQL_USER}.* TO '${MYSQL_USER}'@'%';" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root