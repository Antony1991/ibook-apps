'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
    const { UUID, UUIDV4, STRING, INTEGER } = Sequelize;
    await queryInterface.createTable('roles', {
      id: {
        type: UUID,
        primaryKey: true,
        defaultValue: UUIDV4,
      },
      username: STRING(32),
      role_name: STRING(32),
      password: STRING(64),
      status: {
        type: INTEGER(3),
        defaultValue: 1,
      },
      created_by: STRING(32),
      updated_by: STRING(32),
      created_at: STRING(32),
      updated_at: STRING(32),
      deleted_at: STRING(32),
    });
  },

  async down(queryInterface, Sequelize) {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
    await queryInterface.dropTable('roles');
  },
};
