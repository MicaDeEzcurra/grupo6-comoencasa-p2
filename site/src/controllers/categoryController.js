const { Product } = require('../database/models');


const categoryController = {
  index: (req, res) => {
    const idCategory = req.params.id;
    Product.findAll({
      where: {
        idCategory: idCategory
      }
    }).then(data => {
      let products = data;

      return res.render('categoria', { products});
    })

  }

};

module.exports = categoryController;

