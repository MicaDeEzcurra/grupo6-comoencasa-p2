const { validationResult } = require('express-validator');
const { Product, Category } = require('../database/models');


const controller = {
    index: (req, res) => {
        let vac = {
            title: 'Producto'
        }
        return res.render('producto', vac);
    }
}

    // create: (req, res) => {
    //    Category.findAll()
    //    .then (categories => {
    //     return res.render('creacionProducto', {categories});
    // })
// },

//     store: (req, res) => {
//         let product = req.body
//         // product.id = req.session.id;
//         // product.name = req.session.name;
//         // product.idCategory = req.session.category.id;
//         // product.img = req.file.filename;
//         product.idSeller = req.session.user.id;
        
//         Product.create(product)
//         .then(product => {
//             return res.render('/producto/detalle/' + product.id)
//             });
//         }
// }

    // filtrar: (req, res) => {
    //     const idCategory = req.params.id;

    //     Category.findByPK(idCategory, {
    //         include: ['products']
    //     })
    //         .then(category => {
    //             const products = category.products;

    //             return res.render('categoria', { products })
    //         })
    // }



module.exports = controller;
