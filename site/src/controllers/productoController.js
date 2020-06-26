const { validationResult } = require('express-validator');
const { Product, Category } = require('../database/models');


const controller = {
    index: (req, res) => {
        let vac = {
            title: 'Producto'
        }
        return res.render('producto', vac);
    },

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

}

module.exports = controller;
