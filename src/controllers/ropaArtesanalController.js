// controllers/ropaArtesanalController.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Obtener todas las piezas de ropa artesanal
async function getAllRopaArtesanal(req, res) {
  try {
    const ropaArtesanal = await prisma.ropa_artesanal.findMany();
    res.json(ropaArtesanal);
  } catch (error) {
    console.error('Error al obtener la ropa artesanal:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener la ropa artesanal' });
  }
}

module.exports = {
  getAllRopaArtesanal,
};
