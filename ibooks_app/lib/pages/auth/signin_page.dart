/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 10:11:59
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-06 19:31:34
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/auth/signin_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/Spin.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildHeader(),
        _buildTabs(),
        selectTabIndex == 0 ? _buildSignForm() : _buildRegistForm()
      ],
    );
  }

  /// 渲染登录form
  Widget _buildSignForm() {
    return Container(
      padding: const EdgeInsets.only(left: 55, right: 55, top: 50).r,
      child: Form(
          child: Column(
        children: [
          AuthTextField(
              prefixIcon: IbookIcons.authUserIc,
              hintText: '用户名',
              onChanged: usernameChange),
          20.verticalSpace,
          AuthTextField(
              prefixIcon: IbookIcons.authLockIc,
              hintText: '密码',
              onChanged: passwordChange),
          20.verticalSpace,
          const AuthTextField(
            prefixIcon: IbookIcons.authRandomIc,
            hintText: '验证码',
          ),
          20.verticalSpace,
          AuthButton(
            '登录',
            onTap: () {},
            disabled: (username == null || username!.isEmpty) ||
                (password == null || password!.isEmpty),
          ),
          40.verticalSpace,
          SizedBox(
            height: 36.h,
            child: _buildOtherAction(),
          )
        ],
      )),
    );
  }

  /// 渲染注册form
  Widget _buildRegistForm() {
    return Container(
      padding: const EdgeInsets.only(left: 55, right: 55, top: 50).r,
      child: Form(
          child: Column(
        children: [
          AuthTextField(
              prefixIcon: IbookIcons.authUserIc,
              hintText: '用户名',
              onChanged: usernameChange),
          20.verticalSpace,
          AuthTextField(
              prefixIcon: IbookIcons.authLockIc,
              hintText: '密码',
              onChanged: passwordChange),
          20.verticalSpace,
          AuthTextField(
              prefixIcon: IbookIcons.authLockIc,
              hintText: '确认密码',
              onChanged: passwordChange),
          20.verticalSpace,
          const AuthTextField(
            prefixIcon: IbookIcons.authRandomIc,
            hintText: '验证码',
          ),
          20.verticalSpace,
          AuthButton(
            '注册',
            onTap: () {},
            disabled: (username == null || username!.isEmpty) ||
                (password == null || password!.isEmpty),
          ),
          40.verticalSpace,
          SizedBox(
            height: 36.h,
            child: _buildOtherAction(),
          )
        ],
      )),
    );
  }

  /// 渲染先去逛逛，在线客服
  Widget _buildOtherAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(30.r))),
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () {
                RoutesUtil.pushNamed(context, HomeRouter.home);
              },
              child: Text(
                '先去逛逛',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 14.sp),
              )),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(30.r))),
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () {},
              child: Text(
                '在线客服',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 14.sp),
              )),
        ),
      ],
    );
  }

  /// 渲染tabs
  Widget _buildTabs() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 1.sp),s
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(IbookIcons.authOutline))),
      width: 265.w,
      height: 40.h,
      child: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: selectTabIndex == 0 ? 0 : 132.5.w,
              top: 0,
              bottom: 0,
              width: 132.5.w,
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(IbookIcons.authTabBg))),
              )),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              changeTab(0);
                            });
                          },
                          child: Text('登录',
                              style: TextStyle(
                                  color: IbookTheme.whiteColor,
                                  fontSize: 16.sp))))),
              Expanded(
                flex: 1,
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            changeTab(1);
                          });
                        },
                        child: Text('注册',
                            style: TextStyle(
                                color: IbookTheme.whiteColor,
                                fontSize: 16.sp)))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 头部
  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 50.sp, bottom: 30.sp),
      child: Text('IBOOK APP',
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 30.sp)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(14, 20, 56, 1),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        IbookIcons.authBg,
                      ))),
              child: SingleChildScrollView(
                child: _buildContent(),
              ),
            );
          }
          return const Center(
            child: Spin(),
          );
        },
      ),
    );
  }
}

mixin SigninBLoc on State<SigninPage> {
  late TextEditingController userController;
  late TextEditingController pwdController;
  String? username;
  String? password;
  int selectTabIndex = 0;
  var _future;

  @override
  void initState() {
    userController = TextEditingController();
    pwdController = TextEditingController();
    _future = initFuture();
    super.initState();
  }

  Future initFuture() async {
    return await Future.delayed(const Duration(milliseconds: 300));
  }

  // 切换tab
  void changeTab(int idx) {
    setState(() {
      selectTabIndex = idx;
    });
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
