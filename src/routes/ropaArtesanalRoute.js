// routes/ropaArtesanalRoutes.js
const express = require('express');
const router = express.Router();
const ropaArtesanalController = require('../controllers/ropaArtesanalController');

// Ruta para obtener todas las piezas de ropa artesanal
router.get('/ropa-artesanal', ropaArtesanalController.getAllRopaArtesanal);
router.get('/ropa-artesanal/:id', ropaArtesanalController.getRopaArtesanalById);
router.delete('/ropa-artesanal/:id', ropaArtesanalController.deleteRopaArtesanalById);
router.put('/ropa-artesanal/:id', ropaArtesanalController.updateRopaArtesanalById);

module.exports = router;
