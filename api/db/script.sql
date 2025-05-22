CREATE DATABASE IF NOT EXISTS LojaVirtual;
USE LojaVirtual;

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES ('XBOX SERIES X', 4500);
INSERT INTO products (name, price) VALUES ('XBOX SERIES S', 2500);

DROP USER IF EXISTS 'appuser'@'%'; 
CREATE USER 'appuser'@'%' IDENTIFIED WITH caching_sha2_password BY '12345';
GRANT ALL PRIVILEGES ON LojaVirtual.* TO 'appuser'@'%';
FLUSH PRIVILEGES;
