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

  /**
   * findAll请求根据rule处理query值
   * @param rule 规则
   * @param queryOrigin 原请求参数
   * @param ruleOther 追加规则
   * @param findAllParamsOther 追加搜索字段
   * @param keywordLikeExcludeParams 关键字keyword模糊搜索排除字段
   * @param rule.pageSize
   * @param rule.current
   * @param options
   * @return {{query: {where: {}}, allRule: {offset: {default: number, type: string, required: boolean}, prop_order: {values, type: string, required: boolean}, limit: {type: string, required: boolean}, order: {values: [string, string, string], type: string, required: boolean}}}}
   */
  findAllParamsDeal(options) {
    const { rule, queryOrigin, ruleOther = {}, findAllParamsOther = {} } = options;
    const _rule = { ...rule };
    const query = {
      where: {},
    };
    const findAllParams = {
      current: {
        type: 'number',
        required: false,
        default: 1,
      },
      pageSize: {
        type: 'number',
        required: false,
      },
      ...findAllParamsOther,
    };
    const allRule = {
      ..._rule,
      ...ruleOther,
      ...findAllParams,
    };
    // 根据rule处理query,剔除非rule检查字段
    for (const queryKey in queryOrigin) {
      console.log('--querykey', queryOrigin[queryKey]);
      if (_rule.hasOwnProperty(queryKey)) {
        if (queryKey === 'current') {
          query.where.offset = (queryOrigin[queryKey] - 1) * queryOrigin.pageSize;
        } else if (queryKey === 'pageSize') {
          query.where.limit = queryOrigin.pageSize;
        } else {
          query.where[queryKey] = queryOrigin[queryKey];
        }
      }
      // if (allRule.hasOwnProperty(queryKey)) {
      //   if (queryKey === 'current') {
      //     query.offset = (queryOrigin[queryKey] - 1) * queryKey.pageSize;
      //   } else if (queryKey === 'pageSize') {
      //     query.limit = queryKey.pageSize;
      //   } else {
      //     query[queryKey] = queryOrigin[queryKey];
      //   }
      // }
    }
    // 如果搜索参数queryOrigin中带有keyword，且不为空字符串，则视keyword为模糊搜索
    return {
      allRule,
      query,
    };
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
