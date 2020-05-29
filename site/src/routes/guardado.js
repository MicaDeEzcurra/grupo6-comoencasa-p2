const express = require('express');
const router = express.Router();
const guardadoController = require('../controllers/guardadoController');

router.get('/guardado', guardadoController.index);

module.exports = router;
