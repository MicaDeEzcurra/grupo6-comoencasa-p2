const guardadoController = {
      index: (req, res) => {
          let vac = {
              title: 'guardado'
          }
        return  res.render('guardado', vac);
      }
};

module.exports = guardadoController;