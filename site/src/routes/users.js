const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const validator = require('../middlewares/validator');
const auth = require('../middlewares/auth');
const guest = require('../middlewares/guest');

//ROUTES
// /users/register
router.get('/register', guest, usersController.register);
router.post('/register', validator.register, guest, usersController.processRegister);
// /users/login
router.get('/login', guest, usersController.login);
router.post('/login', validator.login, auth, usersController.processLogin);

//EXPORTS
module.exports = router;