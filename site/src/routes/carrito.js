const express = require('express');
const router = express.Router();
const carritoController = require('../controllers/carritoController');
const authtMiddleware = require('../middlewares/auth');

router.get('/', authtMiddleware, carritoController.index);

module.exports = router;

