const productoController = {
    index: (req, res) => {
        let vac = {
            title: 'Producto'
        }
    res.render('producto', vac);
    }

};

module.exports = productoController;
