const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const db = require('./db');
const cors=require('cors')
const app = express();

app.use(cors());

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, '../PG')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../PG/pedido.html'));
  });

app.post('/orden',(req,res)=>{
    const {Mesa,Propina,Tipo_Cliente,Nombre_Mesero}=req.body
    const query =`INSERT INTO ordenes (Fecha,Hora,Mesa,Propina,ID_Cliente_FK,ID_Mesero_FK) 
    VALUES (CURDATE(),CURTIME(),?,?,(SELECT ID_Cliente FROM clientes WHERE Tipo_Cliente=?),(SELECT ID_Mesero FROM meseros WHERE Nombre_Mesero=?))`;
    
    db.query(query,[Mesa,Propina,Tipo_Cliente,Nombre_Mesero],(err,result)=>{
        if(err){
            console.error('Error al insertar en la base de datos:', err);
            res.status(500).send('Error al procesar la orden');
            return;
        }
        res.send('Orden Recibida');
    });
});
 
app.listen(3000,()=>{
    console.log('Servidor activo');
});