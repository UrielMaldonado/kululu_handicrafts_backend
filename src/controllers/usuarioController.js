// controllers/usuarioController.js
const { PrismaClientKnownRequestError, PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();


// Obtener todos los usuarios
async function getAllUsuarios(req, res) {
    try {
        const usuarios = await prisma.usuario.findMany();
        res.json(usuarios);
    } catch (error) {
        console.error('Error al obtener todos los usuarios:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener todos los usuarios' });
    }
}

// Obtener un usuario por ID
async function getUsuarioById(req, res) {
    const { id } = req.params;
    try {
        const usuario = await prisma.usuario.findUnique({
            where: { id: parseInt(id) },
            include: { role: true, compras: true },
        });
        if (usuario) {
            res.json(usuario);
        } else {
            res.status(404).json({ error: 'El usuario no fue encontrado' });
        }
    } catch (error) {
        console.error('Error al obtener el usuario por ID:', error);
        res.status(500).json({ error: 'Ocurrió un error al obtener el usuario' });
    }
}
// ...

// Crear un nuevo usuario
async function createUsuario(req, res) {
    const newData = req.body; // Ensure to validate and sanitize the data in a real application.
    
    // Assuming "Cliente" role ID is 1 (replace it with the actual ID from your database)
    const clienteRoleId = 2;

    try {
        const createdUsuario = await prisma.usuario.create({
            data: {
                nombre: newData.nombre,
                apellido: newData.apellido,
                email: newData.email,
                password: newData.password,
                rolId: clienteRoleId, // Set the role to "Cliente" automatically
            },
        });
        res.status(201).json(createdUsuario);
    } catch (error) {
        if (error instanceof PrismaClientKnownRequestError && error.code === 'P2002') {
          // Manejar el error de duplicado (correo electrónico ya en uso)
          console.error('Error: El correo electrónico ya está en uso.');
        } else {
          // Manejar otros errores
          console.error('Error al crear el usuario:', error);
        }
      }
}

// ...

/* // Crear un nuevo usuario
async function createUsuario(req, res) {
    const newData = req.body; // Ensure to validate and sanitize the data in a real application.
    try {
        const createdUsuario = await prisma.usuario.create({
            data: {
                nombre: newData.nombre,
                apellido: newData.apellido,
                email: newData.email,
                password: newData.password,
                direccion: newData.direccion,
                rolId: newData.rolId,
            },
        });
        res.status(201).json(createdUsuario);
    } catch (error) {
        console.error('Error al crear el usuario:', error);
        res.status(500).json({ error: 'Ocurrió un error al crear el usuario' });
    }
} */

// Actualizar un usuario por ID
async function updateUsuarioById(req, res) {
    const { id } = req.params;
    const updatedData = req.body; // Ensure to validate and sanitize the data in a real application.
    try {
        const updatedUsuario = await prisma.usuario.update({
            where: { id: parseInt(id) },
            data: {
                nombre: updatedData.nombre,
                apellido: updatedData.apellido,
                email: updatedData.email,
                password: updatedData.password,
                rolId: updatedData.rolId,
            },
        });
        res.json(updatedUsuario);
    } catch (error) {
        console.error('Error al actualizar el usuario:', error);
        res.status(500).json({ error: 'Ocurrió un error al actualizar el usuario' });
    }
}

// Eliminar un usuario por ID
async function deleteUsuarioById(req, res) {
    const { id } = req.params;
    try {
        const deletedUsuario = await prisma.usuario.delete({
            where: { id: parseInt(id) },
        });
        res.json(deletedUsuario);
    } catch (error) {
        console.error('Error al eliminar el usuario:', error);
        res.status(500).json({ error: 'Ocurrió un error al eliminar el usuario' });
    }
}

module.exports = {
    getAllUsuarios,
    getUsuarioById,
    createUsuario,
    updateUsuarioById,
    deleteUsuarioById,
};
