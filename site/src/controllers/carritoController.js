const {
  CartItem,
  Product, 
  Cart,
  sequelize
} = require('../database/models');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const db = require('../database/models')


const controller = {
  addToCart: (req, res) => {

    db.Product.findByPk(req.body.id)
      .then(product => {
        let item = {
          price: product.price,
          status: 0,
          quantity: 1,
          subtotal: product.price * 1,
          idCart: null,
          idSeller: product.idSeller,
          idUser: req.session.user.id,
          idProduct: product.id
        }
        db.CartItem.create(item)
      })
      .then(() => {
        return res.redirect('/carrito')
      })
  },

  index: (req, res) => {
    db.CartItem.findAll({
        where: {
          [Op.and]: [{
              idUser: req.session.user.id
            },
            {
              status: 0
            }
          ]
        },
        include: [{
          association: 'product',
        }],
      })
      .then(products => {
        return res.render("carrito", {
          cartProducts: products
        })
      })

  },

  destroy: function (req, res) {

    CartItem.destroy({
      where: {
        id: req.body.idCartItem,
      }

    }).then(() => {
      return res.redirect("/carrito");
    });
  },

  purchase: function (req, res) {
    let items;
    // Buscar todos los items para tenerlos guardados
    CartItem.findAll({
        where: {
          idUser: req.session.user.id,
          status: 0,
        },
      })
      .then((itemsEncontrados) => {
        items = itemsEncontrados;
        // Cerrar los items
        return sequelize.query(
          `UPDATE cartItem SET status = 1 WHERE idUser = ${req.session.user.id} AND status = 0`
        );
      })
      .then(() => {
        return Cart.findOne({
          order: [
            ["createdAt", "DESC"]
          ],
        });
      })
      .then((cart) => {
        let newCart = {
          cartNumber: cart ? cart.cartNumber + 1 : 1,
          total: items.reduce((total, cartProduct) => (total += cartProduct.subTotal), 0),
          idUser: req.session.user.id,
        };
        return Cart.create(newCart);
      })
      .then((cart) => {
        return sequelize.query(
          `UPDATE cartItem SET idCart = ${cart.id} WHERE idUser = ${req.session.user.id} AND idCart IS NULL`
        );
      })
      .then(() => {
        return res.redirect('/')
      })
  },

}

module.exports = controller;