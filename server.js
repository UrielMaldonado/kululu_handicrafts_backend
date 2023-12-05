const express = require('express');
const { PrismaClient } = require('@prisma/client');
require('dotenv').config();
const cors = require('cors'); // Importa el paquete cors


const productoArtesanal = require('./src/routes/artesaniaProductoRoute');
const usuario = require('./src/routes/usuarioRoutes');
const compra = require('./src/routes/compraRoute');
const rol = require('./src/routes/rolRoute');

const prisma = new PrismaClient();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Habilita CORS para permitir solicitudes desde http://localhost:4200
app.use(cors());

app.use(productoArtesanal, usuario,compra,rol);

app.get('/', (req, res) => {
  res.send('¡Conexión exitosa al backend!');
});
// Antes de la configuración del enrutador


app.listen(PORT, () => {
  console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
