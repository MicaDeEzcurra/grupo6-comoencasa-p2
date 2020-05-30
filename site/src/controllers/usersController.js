const bcrypt = require('bcryptjs');
//instalarlo: npm install bcryptjs
const jsonModel = require('../models/jsonModels');
const userModel = jsonModel('users')

const controller = {
    register: function(req, res) {
        let vac = {
            title: 'Registro'
        }
        res.render('register', vac);
    },

    processRegister: function(req, res) {
        //hasheo la contrasena: aca le estoy diciendo q el req.password equivale a la contrasena haseada
        req.body.password = bcrypt.hashSync(req.body.password, 10);
        
        //aca le digo que borre 
        delete req.body.retype;

        const newUser = {
            id: userModel.nextId(),
            ...req.body //aca le decimos que traiga todo el formulario q lleno el usuario, usamos spread operator
        }

        userModel.save(newUser);

        res.redirect('home');

    }
}

module.exports = controller;