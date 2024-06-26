'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Products', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING,
        allowNull : false
      },
      price: {
        type: Sequelize.INTEGER,
        allowNull : false
      },
      description: {
        type: Sequelize.TEXT,
        allowNull : false
      },
      discount: {
        type: Sequelize.INTEGER
      },
      mainImage: {
        type: Sequelize.STRING,
        
      },
      materialId: {
        type: Sequelize.INTEGER,
        references:{
          model:{
            tableName:'Materials'
          }
        }
      },
      originId: {
        type: Sequelize.INTEGER,
        references:{
          model:{
            tableName:'Origins'
          }
        }
      },
      qualityId: {
        type: Sequelize.INTEGER,
        references:{
          model:{
            tableName:'Qualities'
          }
        }
        
      },
      categoryId: {
        type: Sequelize.INTEGER,
        references:{
          model:{
            tableName:'Categories'
          }
        }
      },
      imageId:{
        type: Sequelize.INTEGER,
        references:{
          model:{
            tableName:'Images'
          }
        }  
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Products');
  }
};