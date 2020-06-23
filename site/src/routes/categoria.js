const express = require('express');
const router = express.Router();
const categoriaController = require('../controllers/categoriaController');

router.get('/', categoriaController.index);
router.get('/categoria/:id', categoriaController.desayuno);
router.get('/categoria/:id', categoriaController.almuerzo);
router.get('/categoria/:id', categoriaController.merienda);
router.get('/categoria/:id', categoriaController.cena);


module.exports = router;