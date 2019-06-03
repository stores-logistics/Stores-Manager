CREATE DATABASE IF NOT EXISTS storesdb;

USE storesdb;

DROP USER IF EXISTS storeuser;
flush privileges;

CREATE USER 'storeuser'@'%' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'storeuser'@'%';
flush privileges;

CREATE TABLE IF NOT EXISTS stores (
  id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name    VARCHAR(45)                 NOT NULL,
  type        VARCHAR(45)             NOT NULL,
  owner        VARCHAR(45)            NOT NULL,
  ubication        VARCHAR(45)        NOT NULL,
  dates      VARCHAR(45)              NOT NULL
) ENGINE = INNODB;
