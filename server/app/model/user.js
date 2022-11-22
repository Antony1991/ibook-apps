
module.exports = app => {
  const { STRING, UUIDV4, UUID } = app.Sequelize;

  const User = app.model.define('user', {
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
  },
    {
      paranoid: true,
      defaultScope: {
        attributes: { exclude: ['password'] },
      },
      scopes: {
        withPassword: {
          attributes: {},
        },
      },
    }

  );
  return User;
};
