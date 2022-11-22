const SUCCESS = 0;
const SERVER_ERROR = 10001;
const NOT_AUTHORIZED = 401;
const EXPIRE_AUTHORIZED = 403;

exports.successResultData = data => {
  return {
    code: SUCCESS,
    msg: '操作成功',
    data,
  };
};

exports.errorResultData = msg => {
  return {
    code: SERVER_ERROR,
    msg: msg ?? '操作失败',
    data: null,
  };
};
exports.notAuthResultData = () => {
  return {
    code: NOT_AUTHORIZED,
    msg: '未授权',
    data: null,
  };
};

exports.expireAuthResultData = () => {
  return {
    code: EXPIRE_AUTHORIZED,
    msg: '授权已过期',
    data: null,
  };
};
