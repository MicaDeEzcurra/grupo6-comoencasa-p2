//requiero e instalo bcrypt - npm install bcryptjs
const bcrypt = require('bcryptjs');
//requiero las funciones modelo q arme
const jsonModel = require('../models/jsonModels');
const userModel = jsonModel('users')

const controller = {
    register: function(req, res) {
        let vac = {
            title: 'Registro'
        }
        return res.render('register', vac);
    },

    processRegister: function(req, res) {
        //hasheo la contrasena: aca le estoy diciendo q el req.password equivale a la contrasena haseada
        req.body.password = bcrypt.hashSync(req.body.password, 10);
        
        //aca le digo que borre 
        delete req.body.retype;

        const newUser = {
            id: userModel.nextId(),
            ...req.body //aca le decimos que traiga todo el formulario q lleno el usuario, usamos spread operator
        };

        userModel.save(newUser);

        return res.redirect('users/login');
    },
    
    login: function(req, res){
        let vac = {
            title: 'Login'
        }
        return res.render('login', vac);
    },

    processLogin: function(req, res) {
//esto funciona como un find. elemento representa a un usuario dentro del array de usuarios en data.
        const user = userModel.findBySomething(function(elemento){
            return elemento.email = req.body.email;
        });
        //cree la const user, para almacenar todos los campos del objeto req body y poder usarlos para ver si la pass q ingresa el usuario coincide con la almacenada o no
        if(user){
            //si encuentra el usuario en la DB, verificar password
            if(bcrypt.compareSync(req.body.password, user.password)){
                //guardar en la session al usuario - requerirlo (en app) e instalarlo (temrinal en carpeta raiz)

                delete user.password;

                req.session.user = user;
                res.locals.user = req.session.user;
                //con res.locals le comparto info del usuario que esta logueado a TODAS las vistas
            } else {
                return res.send('la password no coincide')
            };
        } else{
            return res.send('no encuentra el user')
        };
    }

}

module.exports = controller;