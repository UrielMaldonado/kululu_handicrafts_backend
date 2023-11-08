// routes/ropaArtesanalRoutes.js
const express = require('express');
const router = express.Router();
const accesorioArtesanalController = require('../controllers/accesorioArtesanalController');

// Ruta para obtener todas las piezas de ropa artesanal
router.get('/accesorio-artesanal', accesorioArtesanalController.getAllAccesorioArtesanal);
router.get('/accesorio-artesanal/:id', accesorioArtesanalController.getAccesorioArtesanalById);
router.delete('/accesorio-artesanal/:id', accesorioArtesanalController.deleteAccesorioArtesanalById);
router.put('/accesorio-artesanal/:id', accesorioArtesanalController.updateAccesorioArtesanalById);

module.exports = router;
