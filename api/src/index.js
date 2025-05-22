const express = require('express');
const mysql = require('mysql2');

const app = express();

const connectionConfig = {
  host: process.env.DB_HOST || 'mysql-container',
  user: process.env.DB_USER || 'appuser',
  password: process.env.DB_PASSWORD || '12345',
  database: process.env.DB_NAME || 'LojaVirtual'
};

function connectWithRetry(retries = 5, delay = 3000) {
  const connection = mysql.createConnection(connectionConfig);

  connection.connect(err => {
    if (err) {
      if (retries === 0) {
        console.error('Não foi possível conectar ao MySQL. Encerrando...');
        process.exit(1);
      }
      console.log(`Erro ao conectar ao MySQL. Tentando novamente em ${delay / 1000}s...`, err);
      setTimeout(() => connectWithRetry(retries - 1, delay), delay);
    } else {
      console.log('Conectado ao MySQL com sucesso!');

      app.get('/products', (req, res) => {
        connection.query('SELECT * FROM products', (error, results) => {
          if (error) {
            console.error('Erro ao buscar produtos:', error);
            return res.status(500).send('Erro interno');
          }
          res.send(results.map(item => ({ name: item.name, price: item.price })));
        });
      });

      app.listen(9001, '0.0.0.0', () => {
        console.log('Listening on port 9001');
      });
    }
  });
}

connectWithRetry();
