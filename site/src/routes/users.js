const express = require('express');
const router = express.Router();
const controller = require('../controllers/usersController');

//ROUTES
router.get('/register', controller.register);
router.post('/register', controller.processRegister);

//EXPORTS
module.exports = router;