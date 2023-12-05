// controllers/productoArtesanalController.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Obtener todas las piezas de producto artesanal por tipo
async function getAllProductoArtesanalByType(req, res) {
    const { tipo } = req.params;

    try {
        const productos = await prisma.tbb_artesaniasProducto.findMany({
            where: { tipo: tipo.toLowerCase() },
        });

        res.json(productos);
    } catch (error) {
        console.error('Error al obtener los productos por tipo:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener los productos por tipo' });
    }
}

// Obtener una pieza de producto artesanal por ID
async function getProductoArtesanalById(req, res) {
    const { id } = req.params;
    try {
        const productoArtesanal = await prisma.tbb_artesaniasProducto.findUnique({
            where: { id: parseInt(id) },
        });
        if (productoArtesanal) {
            res.json(productoArtesanal);
        } else {
            res.status(404).json({ error: 'La pieza de producto artesanal no fue encontrada' });
        }
    } catch (error) {
        console.error('Error al obtener el producto artesanal por ID:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener la pieza de producto artesanal' });
    }
}

// Crear una nueva pieza de producto artesanal
async function createProductoArtesanal(req, res) {
    const newData = req.body; // Asegúrate de validar y sanear los datos antes de usarlos en una aplicación real.
    try {
        const createdProductoArtesanal = await prisma.tbb_artesaniasProducto.create({
            data: {
                nombre: newData.nombre,
                descripcion: newData.descripcion,
                precio: newData.precio,
                imagen: newData.imagen,
                stock: newData.stock,
                tipo: newData.tipo,
            },
        });
        res.status(201).json(createdProductoArtesanal); // Devolver código 201 para indicar creación exitosa
    } catch (error) {
        console.error('Error al crear la pieza de producto artesanal:', error);
        res.status(500).json({ error: 'Ocurrió un error al crear la pieza de producto artesanal' });
    }
}

// Actualizar una pieza de producto artesanal por ID
async function updateProductoArtesanalById(req, res) {
    const { id } = req.params;
    const updatedData = req.body; // Asegúrate de validar y sanear los datos antes de usarlos en una aplicación real.
    try {
        const updatedProductoArtesanal = await prisma.tbb_artesaniasProducto.update({
            where: { id: parseInt(id) },
            data: {
                nombre: updatedData.nombre,
                descripcion: updatedData.descripcion,
                precio: updatedData.precio,
                imagen: updatedData.imagen,
                stock: updatedData.stock,
                tipo: updatedData.tipo,
            },
        });
        res.json(updatedProductoArtesanal);
    } catch (error) {
        console.error('Error al actualizar la pieza de producto artesanal:', error);
        res.status(500).json({ error: 'Ocurrió un error al actualizar la pieza de producto artesanal' });
    }
}

// Eliminar una pieza de producto artesanal por ID
async function deleteProductoArtesanalById(req, res) {
    const { id } = req.params;
    try {
        const deletedProductoArtesanal = await prisma.tbb_artesaniasProducto.delete({
            where: { id: parseInt(id) },
        });
        res.json(deletedProductoArtesanal);
    } catch (error) {
        console.error('Error al eliminar la pieza de producto artesanal:', error);
        res.status(500).json({ error: 'Ocurrió un error al eliminar la pieza de producto artesanal' });
    }
}

module.exports = {
    getAllProductoArtesanalByType,
    getProductoArtesanalById,
    createProductoArtesanal,
    updateProductoArtesanalById,
    deleteProductoArtesanalById,
};
