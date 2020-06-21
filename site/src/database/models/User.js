module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.STRING,
        rol: DataTypes.BOOLEAN
    }, {
        timestamps: false
    });
    User.associate = function (models) {
        User.hasMany(models.Product, {
            as: 'products',
            foreignKey: 'idUser'
        })

        User.hasMany(models.Cart, {
            as: 'carts',
            foreignKey: 'idUser'
        })


    };
    return User;
};
