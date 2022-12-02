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
}

module.exports = RoleController;
