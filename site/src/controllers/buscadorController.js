const db = require('../database/models/index.js')
const Product = db.Product;
const Sequelize = require('sequelize');
const sequelize = db.sequelize;
const Op = Sequelize.Op;

const buscadorController = {
     index: (req, res) =>{
       let vac ={
           title: 'Buscador'
       }
       res.render('buscador', vac);
     },

      search : (req, res) => {
        Product.findAll({
          where: {
            name:{[db.Sequelize.Op.like]:req.query.search+"%"} 
          }
        })
        .then(function(result){
          return res.render('productoSearch', {result})
        })
      }

};

module.exports = buscadorController;


















