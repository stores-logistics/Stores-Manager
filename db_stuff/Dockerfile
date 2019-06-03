FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE storesdb
ENV MYSQL_USER storeuser
ENV MYSQL_PASSWORD password

COPY init_db.sql /docker-entrypoint-initdb.d/