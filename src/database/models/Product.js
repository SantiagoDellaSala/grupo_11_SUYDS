'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Product extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Product.init({
    name: DataTypes.STRING,
    price: DataTypes.INTEGER,
    description: DataTypes.TEXT,
    discount: DataTypes.INTEGER,
    mainImage: DataTypes.STRING,
    categoryId: DataTypes.INTEGER,
    materialId: DataTypes.INTEGER,
    originId: DataTypes.INTEGER,
    imageId: DataTypes.INTEGER,
    qualityId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Product',
  });
  return Product;
};