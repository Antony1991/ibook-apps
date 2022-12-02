module.exports = app => {
  const { STRING, UUIDV4, UUID, INTEGER } = app.Sequelize;
  const Role = app.model.define('role', {
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
  return Role;
};
