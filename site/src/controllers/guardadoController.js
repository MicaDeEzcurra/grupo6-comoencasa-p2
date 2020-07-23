const {User, Product, Favorite } = require('../database/models');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const db = require('../database/models')



const guardadoController = {
  index: (req, res) => {
    Favorite.findAll({
      where: {
        [Op.and]: [{
          idUser: req.session.user.id
        }
        ]
      },
      include: [{
        association: 'follow',
      }],
    })
  
      .then((favorites) => {
        return res.render("guardado", { favorites })
      })
  } , 
  add: (req, res) => {

    User.findByPk(req.body.id)
      .then(user => {
        let favorite  = {
          idSeller: user.idSeller,
          idUser: req.session.user.id,
        }
        Favorite.create(favorite)
      })
      .then(() => {
        return res.send(favorite)
      })
    }
};


module.exports = guardadoController;