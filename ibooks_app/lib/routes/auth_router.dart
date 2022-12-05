/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 15:35:17
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 17:11:28
 * @FilePath: /ibook-apps/ibooks_app/lib/routes/auth_router.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/pages/auth/register_page.dart';
import 'package:ibooks_app/pages/auth/signin_page.dart';

class AuthRouter {
  /// 登录
  static String signin = '/auth/signin';

  /// 注册
  static String register = '/auth/register';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      signin: (context) => const SigninPage(),
      register: (context) => const RegisterPage()
    };
  }
}
