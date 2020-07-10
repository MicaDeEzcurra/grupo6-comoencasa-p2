const db = require('../database/models/index.js')
const Product = db.Product;
const sequelize = db.sequelize;
const Op = db.Sequelize.Op;

const buscadorController = {
     index: (req, res) =>{
       sequelize.query('SELECT * FROM products WHERE deletedAt is NULL ORDER BY RAND() LIMIT 5')
       .then(resultados => {
         
          let vac = {
            products: resultados[1],
            title: 'Buscador'
          }
          res.render('buscador', vac);
       })

       
     },

      search : (req, res) => {
        Product.findAll({
          where: {
            name:{
              [Op.substring]: req.body.search
            } 
          }
        })
        .then(function(result){
          return res.render('productoSearch', {result})
        })
      }

};

module.exports = buscadorController;


















