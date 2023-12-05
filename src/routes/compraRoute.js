// routes/compraRoutes.js
const express = require('express');
const router = express.Router();
const compraController = require('../controllers/compraController');

router.get('/compras', compraController.getAllCompras);
router.get('/compra-Id/:id', compraController.getCompraById);
router.post('/compras', compraController.createCompra);
router.put('/compra-Id/:id', compraController.updateCompraById);
router.delete('/compra-Id/:id', compraController.deleteCompraById);

module.exports = router;
