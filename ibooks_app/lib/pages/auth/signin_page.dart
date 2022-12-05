/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 10:11:59
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 18:26:57
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/auth/signin_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/routes/auth_router.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/data_entry/auth_button.dart';
import 'package:ibooks_app/widgets/data_entry/auth_textfield.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with SigninBLoc {
  // 主内容区域
  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Color.fromRGBO(216, 216, 216, 0.4)),
      child: _buildForm(),
    );
  }

  /// 忘记密码
  Widget _buildForgetPwd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () => goToRouteName(AuthRouter.register),
            child: const Text(
              '还没注册？',
              style: TextStyle(color: IbookTheme.whiteColor01),
            )),
        TextButton(
            onPressed: () => goToRouteName(AuthRouter.register),
            child: const Text('忘记密码？',
                style: TextStyle(color: IbookTheme.whiteColor01)))
      ],
    );
  }

  // form
  Widget _buildForm() {
    return Column(
      children: [
        const Text('登录', style: TextStyle(fontSize: 20, color: Colors.white)),
        const SizedBox(height: 50),
        AuthTextField(
            hintText: '用户名',
            prefixIcon: Icons.account_circle,
            onChanged: usernameChange),
        const SizedBox(height: 30),
        AuthTextField(
            obscureText: true,
            hintText: '密码',
            prefixIcon: Icons.lock,
            onChanged: passwordChange),
        _buildForgetPwd(),
        const SizedBox(height: 30),
        AuthButton(
          '登录',
          onTap: () {},
          disabled: (username == null || username!.isEmpty) ||
              (password == null || password!.isEmpty),
        ),
        TextButton(
            onPressed: () {
              RoutesUtil.pushNamed(context, HomeRouter.home);
            },
            child: const Text('先去逛逛',
                style: TextStyle(color: IbookTheme.whiteColor01)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                fit: BoxFit.fill,
                opacity: .7,
                image: AssetImage(
                  IbookIcons.authBg,
                ))),
        child: SingleChildScrollView(
          child: Center(
            child: _buildContent(),
          ),
        ),
      ),
    );
  }
}

mixin SigninBLoc on State<SigninPage> {
  late TextEditingController userController;
  late TextEditingController pwdController;
  String? username;
  String? password;

  @override
  void initState() {
    userController = TextEditingController();
    pwdController = TextEditingController();
    super.initState();
  }

  /// username change
  void usernameChange(String value) {
    setState(() {
      username = value;
    });
  }

  /// password change
  void passwordChange(String value) {
    setState(() {
      password = value;
    });
  }

  /// 跳转注册
  void goToRouteName(String routeName) {
    RoutesUtil.pushNamed(context, routeName);
  }
}
