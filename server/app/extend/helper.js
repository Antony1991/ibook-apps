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
  // jwt未认证
  UNAUTHORIZED({ ctx, res = null, msg = '未认证', code = 401 }) {
    ctx.body = {
      code,
      data: res,
      msg,
    };
  },
  // [*] 表示用户得到授权（与401错误相对），但是访问是被禁止的。
  FORBIDDEN({ ctx, res = null, msg = '权限不足，访问被禁止' }) {
    ctx.body = {
      code: 403,
      data: res,
      msg,
    };
  },
};
