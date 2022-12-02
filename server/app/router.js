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
};
