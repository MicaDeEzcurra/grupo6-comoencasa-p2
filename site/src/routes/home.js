const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');

/* GET home page. */
router.get('/', homeController.index);

router.get('/privacidad', homeController.privacidad);
router.get('/cookies', homeController.cookies);
router.get('/envios', homeController.envios);
router.get('/contacto', homeController.contacto);



module.exports = router;

//TERMINADO