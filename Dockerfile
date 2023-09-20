# https://github.com/docker-library/mysql/blob/master/8.0/Dockerfile.debian
# https://stackoverflow.com/a/73125279
# On MAC computers, use mysql:8 as your base image, i.e., "FROM mysql:8"
FROM mysql:8-debian

ENV MYSQL_ROOT_PASSWORD=Mysecret!_dudb
ENV DATABASE=farmers_market

ENV DB_HOST=127.0.0.1
ENV DB_PORT=3306
ENV DATABASE_IMPORT=FarmersMarketDatabase.sql  

ADD ${DATABASE_IMPORT} .
ADD docker-entry-point.sh .
