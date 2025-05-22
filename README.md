# Trabalho 1 - Prática DevOps
## Daniel de Souza Sobrinho Macedo - 813524

---
## 🛒 Loja Virtual - Aplicação com Docker

Este projeto é uma aplicação de loja virtual composta por:

* 📦 **Backend (API)**: Node.js com Express
* 🐘 **Banco de Dados**: MySQL
* 🌐 **Frontend**: PHP (Apache)

Cada parte da aplicação é containerizada usando Docker. Você pode iniciar os containers manualmente ou com Docker Compose.

---

## 📁 Estrutura do Projeto

```
.
├── api/                  # Backend Node.js
│   ├── db/
│   │   ├── Dockerfile    # Dockerfile do MySQL
│   │   └── script.sql    # Script de criação e popular DB
│   ├── Dockerfile        # Dockerfile do Node.js
│   ├── package.json
│   └── src/
├── website/              # Frontend PHP
│   ├── Dockerfile        # Dockerfile do Apache + PHP
│   └── index.php
├── docker-compose.yml
└── README.md
```

---

## 🚀 Como Executar

### 🔧 Requisitos

* Docker
* Docker Compose
* **Node.js** e **npm** (somente se quiser rodar o backend localmente fora do container)

---

## ✅ Modo 1: Executar com **Docker Compose**

Este é o método mais simples e recomendado.
Abra o terminal na pasta raiz do projeto.

Antes de rodar o container, certifique-se de instalar as dependências:

```bash
cd api
npm install
cd ..
```
agora sim pode 

```bash
docker-compose up --build
```

Para derrubar os containers e remover volumes (como o banco):

```bash
docker-compose down -v
```

### 🔗 Testar Aplicação

* API REST: [http://localhost:9001/products](http://localhost:9001/products)
* Site PHP: [http://localhost:8888](http://localhost:8888)

---

## 🛠️ Modo 2: Executar Manualmente (containers individuais)

Abra o terminal na pasta raiz do projeto.

### 1. 🐬 Banco de Dados MySQL

```bash
# Build da imagem
sudo docker build -t mysql-image -f api/db/Dockerfile .

# Rodar container
sudo docker run -d --rm --name mysql-container mysql-image

# Executar script de criação da base de dados
sudo docker exec -i mysql-container mysql -uroot -p12345 < api/db/script.sql
```

### 2. 🟦 Backend Node.js

Antes de rodar o container, certifique-se de instalar as dependências:

```bash
cd api
npm install
cd ..
```

Em seguida, execute:

```bash
# Build da imagem
sudo docker build -t node-image -f api/Dockerfile .

# Rodar container com link para o banco
sudo docker run -d \
  -v $(pwd)/api:/home/node/app \
  -p 9001:9001 \
  --link mysql-container \
  --rm \
  --name node-container \
  node-image
```

### 3. 🌐 Frontend PHP

```bash
# Build da imagem
sudo docker build -t php-image -f website/Dockerfile .

# Rodar container com link para a API
sudo docker run -d \
  -v $(pwd)/website:/var/www/html \
  -p 8888:80 \
  --link node-container \
  --rm \
  --name php-container \
  php-image
```

---

## 🧪 Testar Funcionalidade

* Acesse o frontend:
  📎 [http://localhost:8888](http://localhost:8888)

* Teste a API diretamente:
  🔗 [http://localhost:9001/products](http://localhost:9001/products)

---

## 📄 Observações

* O banco de dados é iniciado com o script `api/db/script.sql` que cria a base `LojaVirtual` e popula as tabelas.
* As imagens são construídas com base em:

  * `mysql`
  * `node:22-slim`
  * `php:8.2-apache`
* O frontend em PHP se comunica com o backend via `http://node-container:9001`.

