'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    const { INTEGER, STRING, UUIDV4, BOOLEAN, UUID } = Sequelize;
    await queryInterface.createTable('users', {
      id: {
        type: UUID,
        primaryKey: true,
        defaultValue: UUIDV4,
      },
      username: STRING(32),
      password: STRING(64),
      last_login: STRING(32),
      created_at: STRING(32),
      updated_at: STRING(32),
      deleted_at: STRING(32),
    });
  },

  async down(queryInterface) {
    await queryInterface.dropTable('users');
  },
};
