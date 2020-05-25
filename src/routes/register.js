const express = require('express');
const router = express.Router();
const registerController = require('../controllers/registerController');
//Rutas
router.get('/', registerController.create);
router.post('/', registerController.store);

module.exports = router;