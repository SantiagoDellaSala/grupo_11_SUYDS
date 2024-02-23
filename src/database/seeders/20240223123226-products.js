"use strict";

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert(
      "Products",
      [
        {
          name: 'Caña de pescar',
          price: 25000,
          description: 'Caña de largo alcance y resistente.',
          discount: 10,
          mainImage: 'default.png',
          categoryId: 1,
          materialId: 3,
          originId: 3,
          imageId: 35,
          qualityId: 3,
        },
        {
          name: 'Anteojos Galaxy Black',
          price: 14500,
          description: 'Protección y durabilidad, para su seguridad visual.',
          discount: 5,
          mainImage: 'default.png',
          categoryId: 2,
          materialId: 1,
          originId: 2,
          imageId: 14,
          qualityId: 1,
        },  
        {
          name: 'Carpa Storm Red',
          price: 42000,
          description: 'Especial, capacidad para 6 personas. Espaciosa y resistente.',
          discount: 15,
          mainImage: 'default.png',
          categoryId: 3,
          materialId: 2,
          originId: 1,
          imageId: 6,
          qualityId: 2,
        },    
      ],
      {}
    );
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("Products", null, {});
  },
};