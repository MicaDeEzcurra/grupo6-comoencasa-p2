const indexController = {
    index: (req, res) => {
        let vac = {
            title: 'HOME'
        }
        res.render('index', vac);
    }
};

module.exports = indexController;

//TERMINADO NO TOCAR