const express = require('express');
const router = express.Router();
const usuarioController = require('../controllers/usuarioController');

router.get('/usuarios', usuarioController.getAllUsuarios);
router.get('/usuario-Id/:id', usuarioController.getUsuarioById);
router.post('/usuarios', usuarioController.createUsuario);
router.put('/usuario-Id/:id', usuarioController.updateUsuarioById);
router.delete('/usuario-Id/:id', usuarioController.deleteUsuarioById);

module.exports = router;
