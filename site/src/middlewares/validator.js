const {body} = require('express-validator');
//const jsonModel = require('../models/jsonModels');
//const userModel = jsonModel('users')
const bcrypt = require('bcryptjs');
const { User } = require('../database/models');


 module.exports = {
    register:[

        //nombre
        body('name')
        .notEmpty().withMessage('El campo nombre es obligatorio').bail()
        .custom(value => {
            return User.findOne({
                     where: {
                    name: value
                }
            })
                .then(user =>{
                    if (user){
                        return Promise.reject('Usuario registrado')
                    }
                })

        } ),

        //email
         body('email')
          .notEmpty().withMessage('Este campo es obligatorio').bail()
         .isEmail().withMessage('Debes colocar un email válido').bail() 
             .custom(value =>{
                 return User.findOne({

                     where: {
                         email : value
                     }
                 })
                     .then(user => {
                         if (user) {
                             return Promise.reject('Email registrado')
                         }
                     })
        }),
           
    //        //password
         body('password')
            .notEmpty().withMessage('El campo contraseña es obligatorio').bail()
               .isLength({min:6}).withMessage('Debe tener al menos 6 caracteres').bail()
                //req.body.password == req.body.retype).withMessage('Las contraseñas no coinciden'),
               .custom((value, { req }) => {
                //    if(value != req.body.retype){
                //     return false
                //    }

                return value == req.body.retype;

               }).withMessage('Las contraseñas no coinciden'),

             //retype password
              body('retype')
              .notEmpty().withMessage('El campo reingresá contraseña es obligatorio')

     ],

    login:[
        body('email')
        .notEmpty().withMessage('Este campo es obligatorio').bail()
        .isEmail().withMessage('Debes colocar un email válido').bail() 
        .custom((value, {req}) => {
            return User.findOne({
                where: {
                    email: value
                }
            })
                .then(user => {
                    if (user) {
                        // let resultado = bcrypt.compareSync(req.body.password, user.password)
                        // if(resultado){
                        //     return true;
                        // } else {
                        //     return Promise.reject('La contraseña y el email no coinciden')
                        // }

                        if (bcrypt.compareSync(req.body.password, user.password)){
                            return true;
                        } else {
                            return Promise.reject('La contraseña y el email no coinciden')
                        }


                    } else {
                        return Promise.reject('La contraseña y el email no coinciden')
                    }
                })
        }),
    ]

}

