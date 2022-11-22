import { Service } from "egg";

class UserService extends Service {
  /// 创建
  async create(payload) {
    const { ctx, app } = this;
    const { username, password } = payload;
    const currentTime = app.dayjs
  }
}