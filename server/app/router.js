/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 14:08:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 18:01:49
 * @FilePath: /ibook-apps/server/app/router.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  /**
   * 用户
   */
  router.post('/api/v1/users/create', controller.v1.user.create);
  router.post('/api/v1/users/login', controller.v1.user.login);
  router.post('/api/v1/users/findOne', controller.v1.user.findOne);

  /**
   * 角色
   */
  router.post('/api/v1/role/create', controller.v1.role.create);
  router.post('/api/v1/role/list', controller.v1.role.findAll);
  router.post('/api/v1/role/update', controller.v1.role.update);
  router.post('/api/v1/role/delete', controller.v1.role.delete);
};
