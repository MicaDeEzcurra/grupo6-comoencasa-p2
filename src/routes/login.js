const express = require('express');
const router = express.Router();
const loginController = require('../controllers/loginController');

router.get('/', loginController.login);
router.post('/', loginController.login)


module.exports = router;

//TERMINADO, NO TOCAR