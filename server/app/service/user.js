const { Service } = require('egg');
const { Op } = require('sequelize');

class UserService extends Service {
  async findOne(id) {
    const { ctx } = this;
    return await ctx.model.User.findOne({
      where: { id },
      attributes: { exclude: ['password', 'deleted_at'] },
    });
  }
  // create
  async create(payload) {
    const { ctx } = this;
    const { username } = payload;
    const current_time = ctx.app.dayjs().format('YYYY-MM-DD HH:mm:ss');
    const resExistsUsername = await this.existUserFields({ username });
    if (resExistsUsername) {
      return {
        __code_wrong: 40001,
        message: '用户名已存在',
      };
    }
    const passwordObj = await ctx.helper.tools.saltPassword(payload.password);
    payload = { ...payload, ...passwordObj };
    payload.password += payload.salt;
    ctx.logger.info('创建', payload);
    try {
      ctx.logger.info('user', resExistsUsername);
      const res_user = await ctx.model.User.create({
        ...payload,
        created_at: current_time,
        updated_at: current_time,
        last_login: current_time,
      });

      return res_user;
    } catch (e) {
      ctx.logger.error('创建', e);
    }
  }
  async login(payload) {
    const { ctx } = this;
    const user = await ctx.model.User.scope('withPassword')
      .findOne({
        where: { username: payload.username },
      });
    if (!user) {
      return {
        __code_wrong: 40004,
      };
    }
    const passwordObj = await ctx.helper.tools.saltPassword(payload.password, user.dataValues.password.substr(32));
    payload = { ...payload, ...passwordObj };
    payload.password += payload.salt;
    const result = await ctx.model.User.findOne({
      where: { username: payload.username, password: payload.password },
    });
    if (!result) {
      return {
        __code_wrong: 40000,
      };
    }
    return await this.loginDeal(ctx, result);
  }


  // 是否存在此用户字段
  async existUserFields(payload) {
    const { ctx } = this;
    const { username } = payload;
    const where = {};
    where[Op.or] = [];
    username ? where[Op.or].push({ username }) : null;
    return await ctx.model.User.findOne({
      where,
      attributes: { exclude: ['password'] },
    });
  }

  // 登录用户，获取到user后处理
  async loginDeal(ctx, user) {
    const { app } = ctx;
    const current_time = app.dayjs()
      .format('YYYY-MM-DD HH:mm:ss');
    user.update({
      last_login: current_time,
      updated_at: current_time,
    });
    const requestData = { userInfo: { id: user.id, username: user.username } };
    // jwt验证
    return {
      accessToken: await ctx.helper.tools.apply(ctx, requestData, app.config.jwt_exp),
    };
  }
}

module.exports = UserService;
