const express = require('express');
const router = express.Router();
const buscadorController = require('../controllers/buscadorController');

router.get('/', buscadorController.index);

// router.get('/search' , buscadorController.searchView)
router.post('/search', buscadorController.search)

module.exports = router;

