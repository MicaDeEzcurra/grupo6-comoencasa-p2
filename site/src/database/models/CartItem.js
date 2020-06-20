module.exports = (sequelize, DataTypes) => {
    const CartItem = sequelize.define('CartItem', {
        price: DataTypes.DECIMAL,
        quantity: DataTypes.INTEGER,
        status: DataTypes.INTEGER,
        subtotal: DataTypes.DECIMAL,
        idCart: DataTypes.INTEGER,
        idSeller: DataTypes.INTEGER,
        idUser: DataTypes.INTEGER,
    }, {});
    CartItem.associate = function (models) {
        CartItem.belongsTo(models.Cart, {
            as: 'cart',
            foreignKey: 'idCart'
        })

        CartItem.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'idUser'
        })
        CartItem.belongsTo(models.User, {
            as: 'seller',
            foreignKey: 'idSeller'
        })
    };

    return CartItem;
};