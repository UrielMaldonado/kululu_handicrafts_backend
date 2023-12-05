// controllers/compraController.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Obtener todas las compras
async function getAllCompras(req, res) {
    try {
        const compras = await prisma.compra.findMany({
            include: { usuario: true, producto: true },
        });
        res.json(compras);
    } catch (error) {
        console.error('Error al obtener todas las compras:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener todas las compras' });
    }
}

// Obtener una compra por ID
async function getCompraById(req, res) {
    const { id } = req.params;
    try {
        const compra = await prisma.compra.findUnique({
            where: { id: parseInt(id) },
            include: { usuario: true, producto: true },
        });
        if (compra) {
            res.json(compra);
        } else {
            res.status(404).json({ error: 'La compra no fue encontrada' });
        }
    } catch (error) {
        console.error('Error al obtener la compra por ID:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener la compra' });
    }
}

// Crear una nueva compra
async function createCompra(req, res) {
    const newData = req.body; // Ensure to validate and sanitize the data in a real application.

    try {
        const createdCompra = await prisma.compra.create({
            data: {
                usuarioId: newData.usuarioId,
                productoId: newData.productoId,
                direccion: newData.direccion,
                numeroCelular: newData.numeroCelular,
                codigoPostal: newData.codigoPostal,
                indicacionesEnvio: newData.indicacionesEnvio,
            },
            include: { usuario: true, producto: true },
        });
        res.status(201).json(createdCompra);
    } catch (error) {
        console.error('Error al crear la compra:', error);
        res.status(500).json({ error: 'Ocurrió un error al crear la compra' });
    }
}

// Actualizar una compra por ID
async function updateCompraById(req, res) {
    const { id } = req.params;
    const updatedData = req.body; // Ensure to validate and sanitize the data in a real application.

    try {
        const updatedCompra = await prisma.compra.update({
            where: { id: parseInt(id) },
            data: {
                usuarioId: updatedData.usuarioId,
                productoId: updatedData.productoId,
                direccion: updatedData.direccion,
                numeroCelular: updatedData.numeroCelular,
                codigoPostal: updatedData.codigoPostal,
                indicacionesEnvio: updatedData.indicacionesEnvio,
            },
            include: { usuario: true, producto: true },
        });
        res.json(updatedCompra);
    } catch (error) {
        console.error('Error al actualizar la compra:', error);
        res.status(500).json({ error: 'Ocurrió un error al actualizar la compra' });
    }
}

// Eliminar una compra por ID
async function deleteCompraById(req, res) {
    const { id } = req.params;
    try {
        const deletedCompra = await prisma.compra.delete({
            where: { id: parseInt(id) },
        });
        res.json(deletedCompra);
    } catch (error) {
        console.error('Error al eliminar la compra:', error);
        res.status(500).json({ error: 'Ocurrió un error al eliminar la compra' });
    }
}

module.exports = {
    getAllCompras,
    getCompraById,
    createCompra,
    updateCompraById,
    deleteCompraById,
};
