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

        const user = req.body;
        if(errors.isEmpty()){
        //hasheo la contrasena: aca le estoy diciendo q el req.password equivale a la contrasena haseada
        user.password = bcrypt.hashSync(user.password, 10);
        //aca le digo que borre 
        delete user.retype;
        user.rol = 0,

        User.create(user)
             .then(function () {
            return res.redirect('login')})
            .catch(function(err) {
                // print the error details
                console.log(err);
            });
            
    
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
                if(user){
               if(bcrypt.compareSync(req.body.password, user.password)){
                  let userSession = user;

                  delete userSession.password;

                  req.session.user = userSession;

                  return res.redirect('/');

               } else {
                  return res.send('La password no coincide')
               }
            } else {
               return res.send('No se encontro usuario')
            }
         })
    // return res.render('login', { errors: errors.mapped(), old: req.body })   
    //}       
}
}
  module.exports = controller;