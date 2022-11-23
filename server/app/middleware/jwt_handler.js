module.exports = (options, app) => {
  const context = app.createAnonymousContext();
  return async function (ctx, next) {
    try {
      // 如果是非api请求则跳过验证
      if (!/^\/api\//.test(ctx.request.url)) {
        await next();
        return;
      }
      const url = ctx.request.url.replace(/\?.*/g, '');
      if (url === '/api/v1/users/login') {
        await next();
      } else {
        const token = ctx.request.headers.authorization && ctx.request.headers.authorization.split('Bearer ')[1];
        if (!token) {
          return ctx.helper.body.UNAUTHORIZED({ ctx });
        }
        const decoded = await ctx.app.jwt.verify(token, ctx.app.config.jwt.secret);
        ctx.currentRequestData = decoded.data;
        const id = await context.service.user.findOne(ctx.currentRequestData.userInfo.id);
        if (id) {
          await next();
        } else {
          ctx.helper.body.FORBIDDEN({ ctx });
        }
      }

    } catch (error) {
      if (error.name === 'TokenExpiredError') {
        ctx.helper.body.UNAUTHORIZED({ ctx, msg: error.message, code: 401 });
        ctx.logger.info(error);
      } else {
        ctx.helper.body.UNAUTHORIZED({ ctx, msg: error.message, code: 401 });
      }
    }
  };
};
