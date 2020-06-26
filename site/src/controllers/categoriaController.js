const { Product } = require('../database/models');


const categoriaController = {
  index: (req, res) => {
    const idCategory = req.params.id;
    Product.findAll({
      where: {
        idCategory: idCategory
      }
    }).then(data => {
      let products = data
      //let title = 'dasayuno'
      return res.render('categoria', { products});
    })

  }

};

module.exports = categoriaController;

