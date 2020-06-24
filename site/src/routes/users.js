const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const validator = require('../middlewares/validator');
const guestMiddleware = require('../middlewares/guest');

//ROUTES
// /users/register
router.get('/register', guestMiddleware, usersController.register);
router.post('/register', validator.register, usersController.processRegister);


// /users/login
router.get('/login', guestMiddleware, usersController.login); //si el usuario que está entrando al sitio, esta en session, lo redirigimos al home para que empiece a navegar. sino, lo lleva al login
router.post('/login', usersController.processLogin); //aca tenemos que poner el validator.login

//logout
router.post('/logout', usersController.logout);

//EXPORTS
module.exports = router;