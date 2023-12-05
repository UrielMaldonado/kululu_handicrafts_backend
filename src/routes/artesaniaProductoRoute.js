const express = require('express');
const router = express.Router();
const productoArtesanal = require('../controllers/artesaniaProductoContoller');

// Ruta para obtener productos por tipo a través del enum
router.get('/producto-artesanal/:tipo', productoArtesanal.getAllProductoArtesanalByType);

router.get('/producto-artesanal-Id/:id', productoArtesanal.getProductoArtesanalById);
router.delete('/producto-artesanal-Id/:id', productoArtesanal.deleteProductoArtesanalById);
router.put('/producto-artesanal-Id/:id', productoArtesanal.updateProductoArtesanalById);
router.post('/producto-artesanal', productoArtesanal.createProductoArtesanal);

module.exports = router;
