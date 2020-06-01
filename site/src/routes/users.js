const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const validator = require('../middlewares/validator');


//ROUTES
// /users/register
router.get('/register', usersController.register);
router.post('/register', validator.register, usersController.processRegister);
// /users/login
router.get('/login', usersController.login);
router.post('/login', validator.login, usersController.processLogin);

//EXPORTS
module.exports = router;