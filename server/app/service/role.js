const dayjs = require('dayjs');
const { Service } = require('egg');
const { Op } = require('sequelize');
class RoleService extends Service {
  // 获取所有
  async findAll(payload) {
    const { ctx } = this;
    const { offset, limit, where } = payload;
    return await ctx.model.Role.findAndCountAll({
      offset,
      limit,
      where,
    });

  }
  // 创建角色
  async createRole(payload) {
    const { ctx } = this;
    const { username, roleName } = payload;
    const nowTime = dayjs().format('YYYY-MM-DD HH:mm:ss');
    const resExistRoleName = await this.existRoleFields({ username });
    ctx.logger.info('==========', resExistRoleName);
    if (resExistRoleName) {
      return {
        __code_wrong: 40001,
        message: '账号已存在',
      };
    }
    const passwordObj = await ctx.helper.tools.saltPassword(payload.password);
    payload = { ...payload, ...passwordObj };
    payload.password += payload.salt;
    ctx.logger.info('创建', payload);
    try {
      const res_role = await ctx.model.Role.create({
        username,
        password: payload.password,
        role_name: roleName,
        created_at: nowTime,
        updated_at: nowTime,
      });
      return res_role;
    } catch (error) {
      ctx.logger.error('创建', error);
    }
  }

  // 角色是否存在
  async existRoleFields(payload) {
    const { ctx } = this;
    const { username } = payload;
    const where = {};
    where[Op.or] = [];
    username ? where[Op.or].push({ username }) : null;
    return await ctx.model.Role.findOne({
      where,
    });
  }
}

module.exports = RoleService;
