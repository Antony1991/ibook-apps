/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 10:12:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-06 17:22:21
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/auth/register_page.dart
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageeState();
}

class _RegisterPageeState extends State<RegisterPage> with RegisterPageBLoc {
  /// 渲染内容
  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(216, 216, 216, 0.4)),
      child: _buildForm(),
    );
  }

  /// form
  Widget _buildForm() {
    return Column(
      children: [
        const Text('注册', style: TextStyle(fontSize: 20, color: Colors.white)),
        const SizedBox(height: 50),
        Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: AuthTextField(
                    controller: userController,
                    hintText: '用户名',
                    validator: userValidator,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AuthTextField(
                      controller: pwdController,
                      hintText: '密码',
                      validator: pwdValidator,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AuthTextField(
                      controller: confirmPwdController,
                      hintText: '确认密码',
                      validator: confirmPwdValidator,
                    )),
                AuthButton(
                  '提交',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('-----');
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          RoutesUtil.pushNamed(context, AuthRouter.signin);
                        },
                        child: const Text('已经注册？立刻登录',
                            style: TextStyle(color: IbookTheme.whiteColor01))),
                    TextButton(
                        onPressed: () {
                          RoutesUtil.pushNamed(context, HomeRouter.home);
                        },
                        child: const Text('先去逛逛',
                            style: TextStyle(color: IbookTheme.whiteColor01)))
                  ],
                )
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                opacity: .5,
                image: AssetImage(IbookIcons.authBg),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: _buildContent(),
        ),
      ),
    );
  }
}

mixin RegisterPageBLoc on State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? userController;
  TextEditingController? pwdController;
  TextEditingController? confirmPwdController;
  @override
  void initState() {
    userController = TextEditingController();
    pwdController = TextEditingController();
    confirmPwdController = TextEditingController();
    super.initState();
  }

  /// 验证用户名
  String? userValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '用户名不能为空';
    }
    return null;
  }

  /// 验证密码
  String? pwdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '密码不能为空';
    }
    if (value != confirmPwdController?.text) {
      return '两次密码不一致';
    }
    return null;
  }

  /// 验证确认密码
  String? confirmPwdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '确认密码不能为空';
    }
    if (value != pwdController?.text) {
      return '两次密码不一致';
    }
    return null;
  }
}
