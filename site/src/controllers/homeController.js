const homeController = {
    index: (req, res) => {
        let vac = {
            title: 'HOME'
        }
        return res.render('home', vac);
    },

    cookies: (req, res) => {
        let vac = {
            title: 'COOKIES'
        }
        return res.render('cookies', vac);
    },

    envios: (req, res) => {
        let vac = {
            title: 'ENVIOS'
        }
        return res.render('envios', vac);
    },

    privacidad: (req, res) => {
        let vac = {
            title: 'PRIVACIDAD'
        }
        return res.render('privacidad', vac);
    },

    contact: (req, res) => {
        let vac = {
            title: 'CONTACTO'
        }
        return res.render('contact', vac);
    },

};

module.exports = homeController;

//TERMINADO NO TOCAR
