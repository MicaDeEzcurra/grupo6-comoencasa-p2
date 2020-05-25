const fs = require('fs');
const bcryptjs = require('bcryptjs');

const registerController = {
    //Mostar formulario de register
    create: function (req, res) {
        res.render('register');
    },

    //Guardar datos del usuario en json o DB
    store: function (req, res) {
        //Crear un nuevo usuario
        let user = {
            id: '',
            name: req.body.name,
            lastname: req.body.lastname,
            email: req.body.email,
            password: bcryptjs.hashSync(req.body.password, 10),
            genero: req.body.genero
            //faltaria agregar para q guarde la location
        }

        //Agregar al usuario en la base de datos o json.
        let users = fs.readFileSync(__dirname + '/../data/usuarios.json', 'utf8');
        users = JSON.parse(users);
        users = [...users, user]; //Tengo el array de usuarios en formato de objeto
        users = JSON.stringify(users, null, ' ');

        //Guardarlo
        fs.writeFileSync(__dirname + '/../data/usuarios.json', users);

        //una vez que se registro, lo redirijo a la home para que compre cosas
        res.redirect('home');
    }
}


module.exports = registerController;