// controllers/accesorioArtesanalController.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Obtener todos los productos de accesorios artesanales
async function getAllAccesorioArtesanal(req, res) {
  try {
    const accesorioArtesanal = await prisma.accesorioArtesanal.findMany();
    res.json(accesorioArtesanal);
  } catch (error) {
    console.error('Error al obtener los productos de accesorios artesanales:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener los productos de accesorios artesanales' });
  }
}

// Obtener un producto de accesorios artesanales por ID
async function getAccesorioArtesanalById(req, res) {
  const { id } = req.params;
  try {
    const accesorioArtesanal = await prisma.accesorioArtesanal.findUnique({
      where: { id: parseInt(id) },
    });
    if (accesorioArtesanal) {
      res.json(accesorioArtesanal);
    } else {
      res.status(404).json({ error: 'El producto de accesorios artesanales no fue encontrado' });
    }
  } catch (error) {
    console.error('Error al obtener el producto de accesorios artesanales por ID:', error);
    res.status(500).json({ error: 'Ocurrió un error al obtener el producto de accesorios artesanales' });
  }
}

// Eliminar un producto de accesorios artesanales por ID
async function deleteAccesorioArtesanalById(req, res) {
  const { id } = req.params;
  try {
    const deletedAccesorioArtesanal = await prisma.accesorioArtesanal.delete({
      where: { id: parseInt(id) },
    });
    res.json(deletedAccesorioArtesanal);
  } catch (error) {
    console.error('Error al eliminar el producto de accesorios artesanales:', error);
    res.status(500).json({ error: 'Ocurrió un error al eliminar el producto de accesorios artesanales' });
  }
}

// Actualizar un producto de accesorios artesanales por ID
async function updateAccesorioArtesanalById(req, res) {
  const { id } = req.params;
  const updatedData = req.body; // Asegúrate de validar y sanear los datos antes de usarlos en una aplicación real.
  try {
    const updatedAccesorioArtesanal = await prisma.accesorioArtesanal.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });
    res.json(updatedAccesorioArtesanal);
  } catch (error) {
    console.error('Error al actualizar el producto de accesorios artesanales:', error);
    res.status(500).json({ error: 'Ocurrió un error al actualizar el producto de accesorios artesanales' });
  }
}

module.exports = {
  getAllAccesorioArtesanal,
  getAccesorioArtesanalById,
  deleteAccesorioArtesanalById,
  updateAccesorioArtesanalById
};
