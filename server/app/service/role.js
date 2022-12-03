/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 14:08:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 19:31:41
 * @FilePath: /ibook-apps/server/app/service/role.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
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
      attributes: { exclude: [ 'password', 'deleted_at' ] },
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
    // const passwordObj = await ctx.helper.tools.saltPassword(payload.password);
    // payload = { ...payload, ...passwordObj };
    // payload.password += payload.salt;
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
  // 更新角色
  async updateRole(payload) {
    const { ctx } = this;
    const { id, roleName, username, password } = payload;
    const res = await ctx.model.Role.findOne({
      where: {
        id,
      },
    });
    if (!res) {
      return {
        __code_wrong: 40001,
        message: '账号不存在',
      };
    }
    const nowTime = dayjs().format('YYYY-MM-DD HH:mm:ss');
    return await ctx.model.Role.update({
      username,
      role_name: roleName,
      password,
      updated_at: nowTime,
    }, {
      where: { id },
    });
  }
  // 删除角色
  async deleteRole(payload) {
    const { ctx } = this;
    return await ctx.model.Role.destroy({
      where: { id: payload.id },
    });
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
