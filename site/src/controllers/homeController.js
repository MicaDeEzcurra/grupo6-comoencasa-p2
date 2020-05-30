const homeController = {
    index: (req, res) => {
        let vac = {
            title: 'HOME'
        }
        return res.render('home', vac);
    }
};

module.exports = homeController;

//TERMINADO NO TOCAR
