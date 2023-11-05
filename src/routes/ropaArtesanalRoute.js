// routes/ropaArtesanalRoutes.js
const express = require('express');
const router = express.Router();
const ropaArtesanalController = require('../controllers/ropaArtesanalController');

// Ruta para obtener todas las piezas de ropa artesanal
router.get('/ropa-artesanal', ropaArtesanalController.getAllRopaArtesanal);

module.exports = router;
