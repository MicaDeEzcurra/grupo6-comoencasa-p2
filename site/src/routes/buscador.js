const express = require('express');
const router = express.Router();
const buscadorController = require('../controllers/buscadorController');

router.get('/', buscadorController.index);

module.exports = router;

