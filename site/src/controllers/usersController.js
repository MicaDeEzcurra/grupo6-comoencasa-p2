//requiero e instalo bcrypt - npm install bcryptjs
const bcrypt = require("bcryptjs");
//requiero las funciones modelo q arme
//const jsonModel = require('../models/jsonModels');
//const userModel = jsonModel('users');
const { validationResult } = require("express-validator");
const { User } = require("../database/models");

const controller = {
  register: function (req, res) {
    return res.render("register");
  },

  processRegister: function (req, res) {
    const errors = validationResult(req);

    const user = req.body;
    if (errors.isEmpty()) {
      //hasheo la contrasena: aca le estoy diciendo q el req.password equivale a la contrasena haseada
      user.password = bcrypt.hashSync(user.password, 10);
      //aca le digo que borre
      delete user.retype;
      (user.rol = 0),
        User.create(user)
          .then(function () {
            return res.redirect("login");
          })
          .catch(function (err) {
            // print the error details
            console.log(err);
          });
    } else {
      return res.render("register", { errors: errors.mapped(), old: req.body });
    }
  },

  login: function (req, res) {
    return res.render("login");
  },

  processLogin: function (req, res) {
    //const errors = validationResult(req);

    //if (errors.isEmpty()){
    //esto funciona como un find. elemento representa a un usuario dentro del array de usuarios en data.
    //const user = req.body.user

    //cree la const user, para almacenar todos los campos del objeto req body y poder usarlos para ver si la pass q ingresa el usuario coincide con la almacenada o no
    User.findOne({
      where: {
        email: req.body.email,
      },
    }).then(function (user) {
      //si el usuario existe en la DB:
      if (user) {
        //verifico la contraseña..
        if (bcrypt.compareSync(req.body.password, user.password)) {
            //guardo el usuario en session
                //borro la contraseña pq es info sensible y no se guarda en session
            delete user.password;
            req.session.user = user; //aca guardamos el usuario a loguearse
    


          if (req.body.remember) {
            res.cookie("email", user.email, {
              maxAge: 1000 * 60 * 60 * 24,
            });
          } else {
            return res.redirect("/");
          }
        } else {
          //si la contraseña ingresada no existe, le digo que no existe (el usuario si existe)
          return res.send("La password no coincide");
        }
      } else {
        //si el usuario no existe, por que el mail no está en la DB, lo mando al register
        return res.render("register");
      }
    });
    // return res.render('login', { errors: errors.mapped(), old: req.body })
    //}
  },
  logout: function (req, res) {
    req.session.destroy();

    if (req.cookies.email) {
      res.clearCookie("email");
    }

    return res.redirect("/");
  },

  // profile: function (req, res) {
  //     return res.render('users/profile')
  //}
};
module.exports = controller;
