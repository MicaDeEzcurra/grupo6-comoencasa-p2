const express = require('express');
const router = express.Router();
const guardadoController = require('../controllers/guardadoController');

router.get('/', guardadoController.index);

//router.post('/add', guardadoController.add);

module.exports = router;
