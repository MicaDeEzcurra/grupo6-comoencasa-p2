const categoriaController = {
     index: (req, res) =>{
        let vac = {
            title: 'Categoría'
         
     }
       return res.render ('categoria', vac); 
    },

    desayuno: (req, res) => {
    let vac = {
      title: 'desayuno'

    }
    return res.render('desayuno', vac);
  },

  almuerzo: (req, res) => {
    let vac = {
      title: 'almuerzo'

    }
    return res.render('categoria/almuerzo', vac);
  },

  merienda: (req, res) => {
    let vac = {
      title: 'merienda'

    }
    return res.render('categoria/merienda', vac);
  },

  cena: (req, res) => {
    let vac = {
      title: 'cena'

    }
    return res.render('categoria/cena', vac);
  }
};

module.exports = categoriaController;
