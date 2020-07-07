const express = require('express');
const router = express.Router();
const productsApiController = require('../../controllers/apis/productsApiController');

router.get('/', productsApiController.index);


module.exports = router;