const guardadoController = {
      index: (req, res) => {
          let vac = {
              title: 'guardado'
          }
          res.render('guardado', vac);
      }
};

module.exports = guardadoController;