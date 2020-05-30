const categoriaController = {
     index: (req, res) =>{
        let vac = {
            title: 'Categoría'
         
     }
       return res.render ('categoria', vac); 
    }
};

module.exports = categoriaController;
