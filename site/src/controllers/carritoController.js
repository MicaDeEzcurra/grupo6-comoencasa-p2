const carritoController = {
    index: (req, res) =>{
      let vac ={
          title: 'Carrito'
      }
    return  res.render('carrito', vac);
    }

};



module.exports = carritoController;