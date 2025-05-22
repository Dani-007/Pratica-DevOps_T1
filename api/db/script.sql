CREATE DATABASE IF NOT EXISTS LojaVirtual;
USE LojaVirtual;

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES
  ('PlayStation 5', 4499.00),
  ('Nintendo Switch OLED', 2999.00),
  ('Notebook Dell Inspiron 15', 3899.00),
  ('Smartphone Samsung Galaxy S21', 3599.00),
  ('Smartphone Apple iPhone 13', 5299.00),
  ('Smart TV LG 55" 4K', 2799.00),
  ('Smart TV Samsung 50" 4K', 2499.00),
  ('Fone de Ouvido JBL Tune 500', 199.00),
  ('Fone de Ouvido Sony WH-1000XM4', 1499.00),
  ('Caixa de Som Bluetooth JBL Flip 5', 499.00),
  ('Caixa de Som Bluetooth Ultimate Ears Boom 3', 699.00),
  ('Mouse Gamer Logitech G502', 349.00),
  ('Teclado Mecânico Redragon Kumara', 299.00),
  ('Monitor LG 24" Full HD', 899.00),
  ('Monitor Samsung 27" Curvo', 1199.00),
  ('Câmera GoPro HERO9 Black', 2299.00),
  ('Câmera Canon EOS Rebel T7', 2799.00),
  ('Impressora HP DeskJet Ink Advantage 2776', 399.00),
  ('Impressora Epson EcoTank L3150', 1199.00),
  ('Tablet Samsung Galaxy Tab A7', 1299.00),
  ('Tablet Apple iPad 9ª Geração', 3299.00),
  ('Console Xbox One S 1TB', 2299.00),
  ('Console Nintendo Switch Lite', 1899.00),
  ('Notebook Acer Aspire 5', 3499.00),
  ('Notebook Lenovo IdeaPad 3', 3199.00),
  ('Smartphone Motorola Moto G60', 1799.00),
  ('Smartphone Xiaomi Redmi Note 10', 1599.00),
  ('Smartwatch Apple Watch Series 6', 3999.00),
  ('Smartwatch Samsung Galaxy Watch 4', 1499.00),
  ('Roteador TP-Link Archer C6', 249.00),
  ('Roteador D-Link DIR-842', 299.00),
  ('HD Externo Seagate 1TB', 349.00),
  ('SSD Kingston A400 240GB', 199.00),
  ('Placa de Vídeo NVIDIA GeForce RTX 3060', 3999.00),
  ('Placa de Vídeo AMD Radeon RX 6600', 3499.00),
  ('Processador Intel Core i5-11400F', 1199.00),
  ('Processador AMD Ryzen 5 5600X', 1399.00),
  ('Memória RAM Corsair Vengeance 8GB DDR4', 299.00),
  ('Fonte Corsair CV550 550W', 399.00),
  ('Gabinete Gamer Cooler Master MB511', 499.00),
  ('Cadeira Gamer ThunderX3 EC3', 999.00),
  ('Webcam Logitech C920', 499.00),
  ('Microfone Blue Yeti', 899.00),
  ('Controle DualSense PS5', 499.00),
  ('Controle Xbox Wireless', 449.00),
  ('Carregador Portátil Xiaomi 10000mAh', 199.00),
  ('Carregador Portátil Samsung 10000mAh', 179.00),
  ('Leitor de Cartões SanDisk', 49.00),
  ('Pen Drive Kingston 64GB', 59.00),
  ('Cartão de Memória SanDisk 128GB', 89.00),
  ('XBOX SERIES X', 4999.00),
  ('XBOX SERIES S', 2999.00);
  
DROP USER IF EXISTS 'appuser'@'%'; 
CREATE USER 'appuser'@'%' IDENTIFIED WITH caching_sha2_password BY '12345';
GRANT ALL PRIVILEGES ON LojaVirtual.* TO 'appuser'@'%';
FLUSH PRIVILEGES;
