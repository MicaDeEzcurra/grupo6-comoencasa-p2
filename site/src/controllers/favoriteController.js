const favoriteController = {
      index: (req, res) => {
          let vac = {
              title: 'Favoritos'
          }
        return  res.render('favorite', vac);
      }
};

module.exports = favoriteController;