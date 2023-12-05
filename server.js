const express = require('express');
const { PrismaClient } = require('@prisma/client');
require('dotenv').config();
const cors = require('cors'); // Importa el paquete cors


const productoArtesanal = require('./src/routes/artesaniaProductoRoute');
const usuario = require('./src/routes/usuarioRoutes');

const prisma = new PrismaClient();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Habilita CORS para permitir solicitudes desde http://localhost:4200
app.use(cors());

app.use(productoArtesanal, usuario);

app.get('/', (req, res) => {
  res.send('¡Conexión exitosa al backend!');
});
// Antes de la configuración del enrutador


app.listen(PORT, () => {
  console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
