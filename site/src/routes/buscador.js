const express = require('express');
const router = express.Router();
const buscadorController = require('../controllers/buscadorController');

router.get('/buscador', buscadorController.index);

module.exports = router;

