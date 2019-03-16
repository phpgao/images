-- create databases
-- CREATE DATABASE IF NOT EXISTS `db1`;
-- CREATE DATABASE IF NOT EXISTS `db2`;


-- remove remote user
DELETE FROM `mysql`.`user` WHERE Host='%' and User='root';
FLUSH PRIVILEGES;