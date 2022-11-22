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
};
