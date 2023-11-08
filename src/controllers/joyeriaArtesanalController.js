// controllers/joyeriaArtesanalController.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Obtener todas las piezas de joyería artesanal
async function getAllJoyeriaArtesanal(req, res) {
  try {
    const joyeriaArtesanal = await prisma.joyeriaArtesanal.findMany();
    res.json(joyeriaArtesanal);
  } catch (error) {
    console.error('Error al obtener la joyería artesanal:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener la joyería artesanal' });
  }
}

// Obtener una pieza de joyería artesanal por ID
async function getJoyeriaArtesanalById(req, res) {
  const { id } = req.params;
  try {
    const joyeriaArtesanal = await prisma.joyeriaArtesanal.findUnique({
      where: { id: parseInt(id) },
    });
    if (joyeriaArtesanal) {
      res.json(joyeriaArtesanal);
    } else {
      res.status(404).json({ error: 'La pieza de joyería artesanal no fue encontrada' });
    }
  } catch (error) {
    console.error('Error al obtener la joyería artesanal por ID:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener la pieza de joyería artesanal' });
  }
}

// Eliminar una pieza de joyería artesanal por ID
async function deleteJoyeriaArtesanalById(req, res) {
  const { id } = req.params;
  try {
    const deletedJoyeriaArtesanal = await prisma.joyeriaArtesanal.delete({
      where: { id: parseInt(id) },
    });
    res.json(deletedJoyeriaArtesanal);
  } catch (error) {
    console.error('Error al eliminar la pieza de joyería artesanal:', error);
    res.status(500).json({ error: 'Ocurrió un error al eliminar la pieza de joyería artesanal' });
  }
}

// Actualizar una pieza de joyería artesanal por ID
async function updateJoyeriaArtesanalById(req, res) {
  const { id } = req.params;
  const updatedData = req.body; // Asegúrate de validar y sanear los datos antes de usarlos en una aplicación real.
  try {
    const updatedJoyeriaArtesanal = await prisma.joyeriaArtesanal.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });
    res.json(updatedJoyeriaArtesanal);
  } catch (error) {
    console.error('Error al actualizar la pieza de joyería artesanal:', error);
    res.status(500).json({ error: 'Ocurrió un error al actualizar la pieza de joyería artesanal' });
  }
}

module.exports = {
  getAllJoyeriaArtesanal,
  getJoyeriaArtesanalById,
  deleteJoyeriaArtesanalById,
  updateJoyeriaArtesanalById
};
