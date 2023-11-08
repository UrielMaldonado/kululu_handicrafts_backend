const express = require('express');
const { PrismaClient } = require('@prisma/client');
require('dotenv').config();
const cors = require('cors'); // Importa el paquete cors

const accesorioRoutes = require('./src/routes/accesorioArtesanalRoute');
// const compraRoutes = require('./src/routes/compraRoute');
// const elementoCarritoRoutes = require('./src/routes/elementoCarritoRoute');
// const inventarioRoutes = require('./src/routes/inventarioRoute');
const joyeriaArtesanalRoutes = require('./src/routes/joyeriaArtesanalRoute');
// const productoRoutes = require('./src/routes/productoRoute');
const ropaArtesanalRoutes = require('./src/routes/ropaArtesanalRoute');
// const usuarioRoutes = require('./src/routes/usuarioRoute');

const prisma = new PrismaClient();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Habilita CORS para permitir solicitudes desde http://localhost:4200
app.use(cors());

// Usar las rutas relacionadas con las artesanías
app.use(accesorioRoutes);
// app.use(compraRoutes);
// app.use(elementoCarritoRoutes);
// app.use(inventarioRoutes);
app.use(joyeriaArtesanalRoutes);
// app.use(productoRoutes);
app.use(ropaArtesanalRoutes);
// app.use(usuarioRoutes);

app.get('/', (req, res) => {
  res.send('¡Conexión exitosa al backend!');
});

app.listen(PORT, () => {
  console.log(`Servidor en ejecución en http://localhost:${PORT}`);
});
