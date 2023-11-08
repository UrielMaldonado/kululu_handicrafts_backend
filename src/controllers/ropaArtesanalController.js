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

// Obtener una pieza de ropa artesanal por ID
async function getRopaArtesanalById(req, res) {
  const { id } = req.params;
  try {
    const ropaArtesanal = await prisma.ropa_artesanal.findUnique({
      where: { id: parseInt(id) },
    });
    if (ropaArtesanal) {
      res.json(ropaArtesanal);
    } else {
      res.status(404).json({ error: 'La pieza de ropa artesanal no fue encontrada' });
    }
  } catch (error) {
    console.error('Error al obtener la ropa artesanal por ID:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener la pieza de ropa artesanal' });
  }
}
// Eliminar una pieza de ropa artesanal por ID
async function deleteRopaArtesanalById(req, res) {
  const { id } = req.params;
  try {
    const deletedRopaArtesanal = await prisma.ropa_artesanal.delete({
      where: { id: parseInt(id) },
    });
    res.json(deletedRopaArtesanal);
  } catch (error) {
    console.error('Error al eliminar la pieza de ropa artesanal:', error);
    res.status(500).json({ error: 'Ocurrió un error al eliminar la pieza de ropa artesanal' });
  }
}
// Actualizar una pieza de ropa artesanal por ID
async function updateRopaArtesanalById(req, res) {
  const { id } = req.params;
  const updatedData = req.body; // Asegúrate de validar y sanear los datos antes de usarlos en una aplicación real.
  try {
    const updatedRopaArtesanal = await prisma.ropa_artesanal.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });
    res.json(updatedRopaArtesanal);
  } catch (error) {
    console.error('Error al actualizar la pieza de ropa artesanal:', error);
    res.status(500).json({ error: 'Ocurrió un error al actualizar la pieza de ropa artesanal' });
  }
}

module.exports = {
  getAllRopaArtesanal,
  getRopaArtesanalById,
  deleteRopaArtesanalById,
};
