module.exports = (sequelize, DataTypes) => {
    const Product = sequelize.define('Product', {
        name: DataTypes.STRING,
        description: DataTypes.TEXT,
        price: DataTypes.DECIMAL,
        img: DataTypes.STRING,
        idCategory: DataTypes.INTEGER,
        idUser: DataTypes.INTEGER
    }, {});
    Product.associate = function (models) {
        Product.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'idUser'
        })
        Product.belongsTo(models.Category, {
            as: 'category',
            foreignKey: 'idCategory'
        })
    };
    return Product;
};