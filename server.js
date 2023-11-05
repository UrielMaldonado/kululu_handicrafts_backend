const express = require('express');
const { PrismaClient } = require('@prisma/client');
require('dotenv').config();
const cors = require('cors'); // Importa el paquete cors

const artesaniaRoutes = require('./src/routes/ropaArtesanalRoute');

const prisma = new PrismaClient();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Habilita CORS para permitir solicitudes desde http://localhost:4200
app.use(cors());

// Usar las rutas relacionadas con las artesanías
app.use(artesaniaRoutes);

app.get('/', (req, res) => {
  res.send('¡Conexión exitosa al backend!');
});

app.listen(PORT, () => {
  console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
