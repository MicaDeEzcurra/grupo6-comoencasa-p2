const categoriaController = {
     index: (req, res) =>{
        let vac = {
            title: 'Categoría'
         
     }
        res.render ('categoria', vac); 
    }
};

module.exports = categoriaController;
