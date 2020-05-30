
const productoController = {
    index: (req, res) => {
        let vac = {
            title: 'Producto'
        }
    return res.render('producto', vac);
    }

};

module.exports = productoController;
