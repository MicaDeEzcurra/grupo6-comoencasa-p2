const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');

//ROUTES
// /users/register
router.get('/register', usersController.register);
router.post('/register', usersController.processRegister);
// /users/login
//router.get('/login', usersController.login);



//EXPORTS
module.exports = router;