//requiero e instalo bcrypt - npm install bcryptjs
const bcrypt = require('bcryptjs');
//requiero las funciones modelo q arme
const jsonModel = require('../models/jsonModels');
const userModel = jsonModel('users');
const {validationResult} = require('express-validator');

const controller = {
    register: function(req, res) {
        
        return res.render('register');
    },

    processRegister: function(req, res) {

        const errors = validationResult(req);
        //return res.send(errors)

        if(errors.isEmpty()){

        //hasheo la contrasena: aca le estoy diciendo q el req.password equivale a la contrasena haseada
        req.body.password = bcrypt.hashSync(req.body.password, 10);
        
        //aca le digo que borre 
        delete req.body.retype;

        const newUser = {
            id: userModel.nextId(),
            ...req.body //aca le decimos que traiga todo el formulario q lleno el usuario, usamos spread operator
        };

        userModel.save(newUser);

            return res.redirect('/users/login');
    }

       return res.render('/users/register', {errors: errors.mapped(), old:req.body})
    },


    login: function(req, res){
        
        return res.render('login');
    },

    processLogin: function(req, res) {

        const errors = validationResult(req);

        if (errors.isEmpty()){
//esto funciona como un find. elemento representa a un usuario dentro del array de usuarios en data.
        const user = userModel.findBySomething(e => e.email == req.body.email);
        
        //cree la const user, para almacenar todos los campos del objeto req body y poder usarlos para ver si la pass q ingresa el usuario coincide con la almacenada o no
       
                delete user.password;

                req.session.user = user;
           
    
            return res.redirect('home');
            }
     return res.render('users/login', { errors: errors.mapped(), old: req.body })   
    }       
}
  module.exports = controller;