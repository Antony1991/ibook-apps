const { Controller } = require('egg');

class UserController extends Controller {
  /**
   * 寻找单个用户
   */
  async findOne() {
    const { ctx, service } = this;
    ctx.logger.info('用户', ctx.request.body);
    const res = await service.user.findOne(ctx.request.body.id);
    return ctx.helper.body.SUCCESS({ ctx, res });
  }
  /**
   * 创建用户
   */
  async create() {
    const { ctx, service } = this;
    const params = {
      username: ctx.request.body.username,
      password: ctx.request.body.password,
    };
    const res = await service.user.create(params);
    ctx.logger.info('code=========', res.__code_wrong);
    if (!res.__code_wrong) {
      ctx.helper.body.SUCCESS({ ctx });
    } else {
      ctx.helper.body.INVALID_REQUEST({ ctx, code: res.__code_wrong, msg: res.message });
    }
  }
  /**
   * @param payload
   * @summary 登录
   * @description 登录
   * @router post /api/user/login
   * @request body userBodyReq
   */
  async login() {
    const { ctx, service } = this;
    ctx.logger.info('请求参数：', ctx.rule);
    const beforeParams = {
      username: {
        type: 'string',
        require: true,
        trim: true,
      },
      password: {
        type: 'string',
        required: true,
        trim: true,
      },
    };

    const params = {
      username: ctx.request.body.username,
      password: ctx.request.body.password,
    };

    ctx.validate(beforeParams, ctx.request.body);
    const res = await service.user.login(params);
    switch (res.__code_wrong) {
      case undefined:
        ctx.helper.body.SUCCESS({ ctx, res });
        break;
      case 40000:
        ctx.helper.body.INVALID_REQUEST({ ctx, code: 40000, msg: '密码错误' });
        break;
      case 40004:
        ctx.helper.body.INVALID_REQUEST({ ctx, code: 40004, msg: '用户不存在' });
        break;
      default:
        ctx.helper.body.INVALID_REQUEST({ ctx, msg: '账号或密码错误' });
    }
    return res;
  }
}

module.exports = UserController;
