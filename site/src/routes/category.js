const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/categoryController');

router.get('/:id', categoryController.index);
//srouter.get('/:id', categoriaController.desayuno);
// router.get('/categoria/:id', categoriaController.almuerzo);
// router.get('/categoria/:id', categoriaController.merienda);
// router.get('/categoria/:id', categoriaController.cena);


module.exports = router;