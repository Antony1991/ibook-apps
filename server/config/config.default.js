/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 14:08:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 15:02:08
 * @FilePath: /ibook-apps/server/config/config.default.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
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
  config.middleware = [ 'jwtHandler' ];
  config.security = {
    domainWhiteList: [ 'https://hoppscotch.io' ],
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
    password: '',
    exclude: 'index.js',
  };
  config.jwt = {
    secret: 'ibooks-backend',
  };
  config.cors = {
    origin: '*',
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH',
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
