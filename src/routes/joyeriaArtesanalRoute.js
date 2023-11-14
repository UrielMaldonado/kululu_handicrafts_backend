// routes/joyeriaArtesanalRoutes.js
const express = require('express');
const router = express.Router();
const joyeriaArtesanalController = require('../controllers/joyeriaArtesanalController');

// Ruta para obtener todas las piezas de joyería artesanal
router.get('/joyeria-artesanal', joyeriaArtesanalController.getAllJoyeriaArtesanal);
router.get('/joyeria-artesanal/:id', joyeriaArtesanalController.getJoyeriaArtesanalById);
router.delete('/joyeria-artesanal/:id', joyeriaArtesanalController.deleteJoyeriaArtesanalById);
router.put('/joyeria-artesanal/:id', joyeriaArtesanalController.updateJoyeriaArtesanalById);
router.post('/joyeria-artesanal', joyeriaArtesanalController.createJoyeriaArtesanal);

module.exports = router;
