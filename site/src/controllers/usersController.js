//requiero e instalo bcrypt - npm install bcryptjs
const bcrypt = require('bcryptjs');
//requiero las funciones modelo q arme
//const jsonModel = require('../models/jsonModels');
//const userModel = jsonModel('users');
const {validationResult} = require('express-validator');
const { User } = require('../database/models');


const controller = {
    register: function(req, res) {
        
        return res.render('register');
    },

    processRegister: function(req, res) {

        const errors = validationResult(req);
        //return res.send(errors)
        const user = req.body;
        if(errors.isEmpty()){

        //hasheo la contrasena: aca le estoy diciendo q el req.password equivale a la contrasena haseada
        user.password = bcrypt.hashSync(user.password, 10);
        
        //aca le digo que borre 
        delete user.retype;
        user.rol = 0,

        //const newUser = {
         //   id: userModel.nextId(),
         //   ...req.body //aca le decimos que traiga todo el formulario q lleno el usuario, usamos spread operator
        //};

        User.create(user)
             .then(function () {
            return res.redirect('login');
    })
    } else {  
       return res.render('register', {errors: errors.mapped(), old:req.body})
    }
    },

    login: function(req, res){
        
        return res.render('login');
    },

    processLogin: function(req, res) {

        //const errors = validationResult(req);

        //if (errors.isEmpty()){
//esto funciona como un find. elemento representa a un usuario dentro del array de usuarios en data.
        //const user = req.body.user
        
        //cree la const user, para almacenar todos los campos del objeto req body y poder usarlos para ver si la pass q ingresa el usuario coincide con la almacenada o no
        User.findOne({
            where: {
                email: req.body.email
            }

        })

            .then(function (user) {
                delete user.password;

                req.session.user = user;
           
    
            return res.redirect('/');
            })
    // return res.render('login', { errors: errors.mapped(), old: req.body })   
    //}       
}
}
  module.exports = controller;