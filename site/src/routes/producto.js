const express = require('express');
const router = express.Router();
const productoController = require('../controllers/productoController');
const multer = require('multer');
const path = require('path');
const validator = require('../middlewares/validator');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.resolve(__dirname, '../../public/img'))
    },
    filename: function (req, file, cb) {
        cb(null, file.filename + '-' + Date.now() + path.extname(file.originalname))
    }
})
var upload = multer({
    storage: storage,
    // Validate image
    fileFilter: (req, file, cb) => {
        console.log(file)
        const acceptedExtensions = ['.jpg', '.jpeg', '.png'];
        const ext = path.extname(file.originalname);
        if (!acceptedExtensions.includes(ext)) {
            req.file = file;
        }
        cb(null, acceptedExtensions.includes(ext));
    }
});


router.get('/', productoController.index);
router.get('/detail/:productId/', productoController.detail);

router.get('/create/', productoController.create);
router.post('/create/', upload.single('img'), validator.creacion, productoController.store);

router.get('/edit/:productId', productoController.edit);
router.post('/edit/:productId', upload.single('img'), validator.edicion, productoController.update); /* PUT - Update in DB */

router.post('/delete/', productoController.destroy); 

router.get('/:productId', productoController.show);

/*carrito*/
// router.post('/addToCart', productoController.addToCart);




module.exports = router;


// '../../public/img/producto'