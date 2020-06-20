const {body} = require('express-validator');
const jsonModel = require('../models/jsonModels');
const userModel = jsonModel('users')
const bcrypt = require('bcryptjs');


 module.exports = {
    register:[

        //nombre
        body('name')
        .notEmpty().withMessage('El campo nombre es obligatorio'),

        //email
        body('email')
        .notEmpty().withMessage('Este campo es obligatorio').bail()
           .isEmail().withMessage('Debes colocar un email válido').bail() 
           .custom((value, {req}) =>{
                 const user = userModel.findBySomething( e => e.email == req.body.email)
                 if(user){
                 return false
                 }
                 return true
           }).withMessage('El email ya está registrado'),
        
           
           //password
        body('password')
             .notEmpty().withMessage('El campo contraseña es obligatorio').bail()
             .isLength({min:6}).withMessage('Debe tener al menos 6 caracteres').bail()
             .custom((value, {req}) => req.body.password == req.body.retype).withMessage('Las contraseñas no coinciden'),
            
            
            //retype password
             body('retype')
             .notEmpty().withMessage('El campo reingresá contraseña es obligatorio')

    ],

    login:[
        body('email')
        .notEmpty().withMessage('Este campo es obligatorio').bail()
        .isEmail().withMessage('Debes colocar un email válido').bail() 
        .custom((value, {req}) =>{
            const user = userModel.findBySomething( e => e.email == req.body.email)
            if(user){
               if (bcrypt.compareSync(req.body.password, user.password)){
            return true
            }
        }
            return false;
      }).withMessage('La contraseña y el email no coinciden'),
    ]

}

