const express = require('express');
const router = express.Router();
const carritoController = require('../controllers/carritoController');
const authtMiddleware = require('../middlewares/auth');

router.get('/', authtMiddleware, carritoController.index);

router.post('/addToCart', carritoController.addToCart);

router.post('/delete', carritoController.destroy);

/* router.post('/update', carritoController.update); */

router.post('/purchase', carritoController.purchase);

router.get('/history', carritoController.history)

module.exports = router;

