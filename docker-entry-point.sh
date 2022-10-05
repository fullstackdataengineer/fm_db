#!/usr/bin/env bash

# Wait until MySQL is accepting connections
# https://stackoverflow.com/questions/25503412/how-do-i-know-when-my-docker-mysql-container-is-up-and-mysql-is-ready-for-taking
# while !  wget ${DB_HOST}:${DB_PORT}; do echo "Trying to connect..."; sleep 5; done

while ! mysql -h ${DB_HOST} -P ${DB_PORT} -uroot -p${MYSQL_ROOT_PASSWORD} < ${DATABASE_IMPORT}; do echo "Trying to connect..."; sleep 5; done
echo "Database imported!"

mysql -h ${DB_HOST} -P ${DB_PORT} -uroot -p${MYSQL_ROOT_PASSWORD} -e "use ${DATABASE}; show tables;"
