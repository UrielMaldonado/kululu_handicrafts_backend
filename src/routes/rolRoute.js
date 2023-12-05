// routes/rolRoutes.js
const express = require('express');
const router = express.Router();
const rolController = require('../controllers/rolController');

router.get('/roles', rolController.getAllRoles);
router.get('/rol-Id/:id', rolController.getRolById);
router.post('/roles', rolController.createRol);
router.put('/rol-Id/:id', rolController.updateRolById);
router.delete('/rol-Id/:id', rolController.deleteRolById);

module.exports = router;
