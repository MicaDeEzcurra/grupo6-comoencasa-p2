const fs = require('fs');
const bcryptjs = require('bcryptjs');

const loginController = {
    //El usuario ingresa a su cuenta
    login: function (req, res) {
        //Traer todo los usuarios de la DB
        let users = fs.readFileSync(__dirname + '/../data/usuarios.json', 'utf8');
        users = JSON.parse(users);

        //PREGUNTAR SI PUEDO PONER ESTO EN UN MIDDLEWARE, y poner middleware de session
        //Chequear que el usuario exista en la lista de usuarios.
        users.forEach(function (user) {
            if (req.body.email === user.email && bcryptjs.compare(req.body.password, user.password)) {
                //Si el usuario esta logueado, lo derivo a la home
                res.render('home')
            }
        });

        //Si no está logueado lo llevo devuelta a register
        res.render('register');

    }
}

module.exports = loginController;