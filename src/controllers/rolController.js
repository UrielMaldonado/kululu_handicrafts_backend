// controllers/rolController.js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// Obtener todos los roles
async function getAllRoles(req, res) {
    try {
        const roles = await prisma.rol.findMany({
            include: { usuarios: true },
        });
        res.json(roles);
    } catch (error) {
        console.error('Error al obtener todos los roles:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener todos los roles' });
    }
}

// Obtener un rol por ID
async function getRolById(req, res) {
    const { id } = req.params;
    try {
        const rol = await prisma.rol.findUnique({
            where: { id: parseInt(id) },
            include: { usuarios: true },
        });
        if (rol) {
            res.json(rol);
        } else {
            res.status(404).json({ error: 'El rol no fue encontrado' });
        }
    } catch (error) {
        console.error('Error al obtener el rol por ID:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener el rol' });
    }
}

// Crear un nuevo rol
async function createRol(req, res) {
    const newData = req.body; // Asegúrate de validar y sanitizar los datos en una aplicación real.

    try {
        const createdRol = await prisma.rol.create({
            data: {
                rol: newData.rol,
            },
        });
        res.status(201).json(createdRol);
    } catch (error) {
        console.error('Error al crear el rol:', error);
        res.status(500).json({ error: 'Ocurrió un error al crear el rol' });
    }
}

// Actualizar un rol por ID
async function updateRolById(req, res) {
    const { id } = req.params;
    const updatedData = req.body; // Asegúrate de validar y sanitizar los datos en una aplicación real.

    try {
        const updatedRol = await prisma.rol.update({
            where: { id: parseInt(id) },
            data: {
                rol: updatedData.rol,
            },
        });
        res.json(updatedRol);
    } catch (error) {
        console.error('Error al actualizar el rol:', error);
        res.status(500).json({ error: 'Ocurrió un error al actualizar el rol' });
    }
}

// Eliminar un rol por ID
async function deleteRolById(req, res) {
    const { id } = req.params;
    try {
        const deletedRol = await prisma.rol.delete({
            where: { id: parseInt(id) },
        });
        res.json(deletedRol);
    } catch (error) {
        console.error('Error al eliminar el rol:', error);
        res.status(500).json({ error: 'Ocurrió un error al eliminar el rol' });
    }
}

module.exports = {
    getAllRoles,
    getRolById,
    createRol,
    updateRolById,
    deleteRolById,
};
