'use strict';
/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1669041673154_8743';

  // add your middleware config here
  config.middleware = ['jwtHandler'];
  config.security = {
    csrf: {
      headerName: 'x-csrf-token',
      enable: false,
      // 过滤不需要进行csrf验证的接口
      ignore: ctx => {
        return [
          '/api/v1/users/login', // 登录
          '/api/v1/users/create', // 创建用户
        ].includes(ctx.request.url);
      },
    },
  };

  config.validate = {
    // 配置参数校验器，基于parameter
    convert: true, // 对参数可以使用convertType规则进行类型转换
    // validateRoot: false,   // 限制被验证值必须是一个对象。
  };
  config.sequelize = {
    database: 'egg_ibooks',
    password: '123456',
    exclude: 'index.js',
  };
  config.jwt = {
    secret: 'ibooks-backend',
  };

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
    jwt_exp: 60 * 60 * 10, // jwt过期时间(秒)
  };

  return {
    ...config,
    ...userConfig,
  };
};
