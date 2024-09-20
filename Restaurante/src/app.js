const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const db = require('./db');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, '../public')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../public/index.html'));
});

app.post('/orden', (req, res) => {
  const { nombre_mesero, fecha_orden, hora_cobro, mesa, producto, tipo_cliente } = req.body;

  const query = `INSERT INTO factura (meseroid_mesero, fecha, hora_cobro, mesa, clienteid_cliente) 
                 VALUES ((SELECT id_mesero FROM mesero WHERE nombre_mesero = ?), ?, ?, ?, 
                         (SELECT id_cliente FROM cliente WHERE tipo_cliente = ?))`;
  
  db.query(query, [nombre_mesero, fecha_orden, hora_cobro, mesa, tipo_cliente], (err, result) => {
    if (err) {
      console.error('Error al insertar en la base de datos:', err);
      res.status(500).send('Error al procesar la orden');
      return;
    }
    res.send('Orden recibida');
  });
});

app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});