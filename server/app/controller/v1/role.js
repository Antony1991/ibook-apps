/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-03 14:08:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-03 18:00:59
 * @FilePath: /ibook-apps/server/app/controller/v1/role.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
const { Controller } = require('egg');

class RoleController extends Controller {
  async findAll() {
    const { ctx, service } = this;
    const { query } = ctx.helper.tools.findAllParamsDeal({
      rule: {},
      queryOrigin: ctx.request.body,
    });
    const res = await service.role.findAll(query);
    console.log('-----res', res);
    ctx.helper.body.SUCCESS({ ctx, res });
  }
  async create() {
    const { ctx, service } = this;
    const res = await service.role.createRole(ctx.request.body);
    if (!res.__code_wrong) {
      ctx.helper.body.SUCCESS({ ctx });
    } else {
      ctx.helper.body.INVALID_REQUEST({ ctx, code: res.__code_wrong, msg: res.message });
    }
  }
  // 更新
  async update() {
    const { ctx, service } = this;
    const body = ctx.request.body;
    const payload = {
      username: body.username,
      id: body.id,
      roleName: body.roleName,
      password: body.password,
    };
    const res = await service.role.updateRole(payload);
    if (res.__code_wrong) {
      ctx.helper.body.INVALID_REQUEST({ ctx, code: res.__code_wrong, msg: res.message });
    } else {
      ctx.header.body.SUCCESS({ ctx });
    }
  }
  // 删除
  async delete() {
    const { ctx, service } = this;
    const res = await service.role.deleteRole(ctx.request.body);
    console.log('------res', res);
    ctx.helper.body.SUCCESS({ ctx });
    // if(res) {
    //   ctx.helper.body.SUCCESS({ctx})
    // }
  }
}

module.exports = RoleController;
