const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const validator = require('../middlewares/validator');
const guestMiddleware = require('../middlewares/guest');
const authtMiddleware = require('../middlewares/auth');

//ROUTES
// /users/register
router.get('/register', guestMiddleware, usersController.register);
router.post('/register', validator.register, guestMiddleware,  usersController.processRegister);


// /users/login
router.get('/login', guestMiddleware, usersController.login); //si el usuario que está entrando al sitio, esta en session, lo redirigimos al home para que empiece a navegar. sino, lo lleva al login
router.post('/login', guestMiddleware, usersController.processLogin); //aca tenemos que poner el validator.login

//logout
router.post('/logout', authtMiddleware, usersController.logout);

//EXPORTS
module.exports = router;