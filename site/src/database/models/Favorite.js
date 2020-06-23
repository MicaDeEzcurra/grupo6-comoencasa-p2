module.exports = (sequelize, DataTypes) => {
    const Favorite = sequelize.define('Favorite', {
        idUser: DataTypes.INTEGER,
        idSeller: DataTypes.INTEGER

    });
    // Favorite.associate = function (models) {
    //     Favorite.hasMany(models.User, {
    //         as: 'users',
    //         foreignKey: 'idUser',
    //     })
    //     Favorite.hasMany(models.User, {
    //         as: 'favoriteUsers',
    //         foreignKey: 'idSeller',
    //     })
    // };
    return Favorite;
};