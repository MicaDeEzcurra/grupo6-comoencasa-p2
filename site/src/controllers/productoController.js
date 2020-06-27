const { validationResult } = require('express-validator');
const { Product, Category } = require('../database/models');


const controller = {
    index: (req, res) => {
        let vac = {
            title: 'Producto'
        }
        return res.render('producto', vac);

    },

    detail: (req, res) => {

        Product.findByPk(req.params.productId, {
            include: ['category', 'user']

            // include: [
            // 	{association: 'category'},
            // 	{ association: 'user' }
            // ],

            // include: {
            // 	all: true,
            // 	nested: true
            // }

        })
            .then(product => res.render('detalle', { product }))

    },

    create: (req, res) => {
        Category.findAll()
            .then(categories => {
                return res.render('creacionProducto', { categories });
            })
    },

    store: (req, res) => {
        let product = req.body
        product.img = req.file.filename;
        product.idSeller = req.session.user.id;

        Product.create(product)
            .then(product => {
                return res.redirect('/producto/detail/' + product.id)
            })

    },

     edit: (req, res) => {

         const product = Product.findByPk(req.params.productId);

        const categories = Category.findAll();

         Promise.all([product, categories])
             .then(([product, categories]) => {
                 return res.render('edicionProducto', { product, categories })
             })
     },

    update: (req, res) => {
        let product = req.body;
        product.idUser = req.session.user.id
        product.img = req.file.filename
        Product.update(product, {
            where: {
                id: req.params.productId
            }
        })
            .then(confirm => {
                return res.redirect('/producto/detail/' + req.params.productId)
            })
            .catch(error => console.log(error))

    },

     //destroy: (req, res) => {

    //     Product.destroy({
    //         where: {
    //             id: req.params.id
    //         }
    //     })
    //         .then(() => {
    //             return res.redirect(home)
    //         })

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

}

module.exports = controller;
