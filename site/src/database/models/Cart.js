module.exports = (sequelize, DataTypes) => {
    const Cart = sequelize.define('Cart', {
        cartNumber: DataTypes.INTEGER,
        total: DataTypes.DECIMAL,
        idUser: DataTypes.INTEGER,

    }, {});
    Cart.associate = function (models) {
        Cart.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'idUser'
        })
    };
    return Cart;
};