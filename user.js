
module.exports = app => {
  const { INTEGER, STRING, UUIDV4, BOOLEAN, UUID } = app.Sequelize;

  const User = app.model.define('user', {
    id: {
      type: UUID,
      primaryKey: true,
      defaultValue: UUIDV4,
    },
    name: STRING(32),
    password: STRING(64),
    nickName: STRING(32),
    nickNameTip: STRING(32),
    address: STRING(128),
    addressCipher: STRING(128),
    areaCode: STRING(32),
    areaName: STRING(32),
    avatar: STRING(32),
    birthday: STRING(32),
    centerMoney: STRING(32),
    createdAt: STRING(32),
    email: STRING(32),
    emailCipher: STRING(32),
    grade: INTEGER,
    lastDays: STRING(16),
    lastLoginIp: STRING(16),
    lastLoginTime: STRING(32),
    memberTotalBalance: STRING(32),
    nickNameUpdateFlag: BOOLEAN,
    passwordFlag: BOOLEAN,
    phone: STRING(32),
    phoneCipher: STRING(32),
    provinces: STRING(64),
    provincesCipher: STRING(64),
    qq: STRING(32),
    qqCipher: STRING(32),
    realName: STRING(32),
    realNameCipher: STRING(32),
    registerIp: STRING(32),
    sex: INTEGER,
    siteName: STRING(32),
    status: INTEGER,
    tagId: STRING(32),
    topId: INTEGER,
    wechat: STRING(32),
    wechatCipher: STRING(32),
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
