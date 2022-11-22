const crypto = require('crypto');
// 工具
module.exports.tools = {
  // 密码加密
  async saltPassword(password, salt = crypto.createHash('md5').update(Math.random().toString()).digest('hex')) {
    const password_finally = crypto.createHash('md5').update(password + ':' + salt).digest('hex');
    return {
      salt,
      password: password_finally,
    };
  },
  // jwt加密
  async apply(ctx, params = {}, exp = 60, secret = ctx.app.config.jwt.secret) {
    return ctx.app.jwt.sign({
      data: params,
      exp: Math.floor(Date.now() / 1000) + exp,
    }, secret);
  },
};

module.exports.body = {
  // 服务器成功返回用户请求
  SUCCESS({ ctx, res = null, msg = '操作成功', code = 0 }) {
    ctx.body = {
      code,
      data: res,
      msg,
    };
  },
  // 请求错误
  INVALID_REQUEST({ ctx, res = null, msg = '请求错误', code = 400 }) {
    ctx.body = {
      code,
      data: res,
      msg,
    };
  },
};
