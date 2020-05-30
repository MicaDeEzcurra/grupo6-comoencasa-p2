const buscadorController = {
     index: (req, res) =>{
       let vac ={
           title: 'Buscador'
       }
       res.render('buscador', vac);
     }

};

module.exports = buscadorController;


















