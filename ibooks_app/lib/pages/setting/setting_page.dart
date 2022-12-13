import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
          child: ListView(
        padding: const EdgeInsets.all(10).r,
        children: [
          _buildFirstCells(),
          10.verticalSpace,
          _buildCells2(),
          10.verticalSpace,
          _buildCells3(),
          10.verticalSpace,
          _buildCells4()
        ],
      )),
    );
  }

  /// cell4
  Widget _buildCells4() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6).r,
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: _buildCell('关于我们'),
            ),
          ],
        ));
  }

  /// cell3
  Widget _buildCells3() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6).r,
        child: Column(
          children: [
            _buildCell('夜间模式',
                switchWidget: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 20.h),
                    child: Transform.scale(
                      scale: .9,
                      child: Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (bool value) {}),
                    ))),
            const Divider(),
            _buildCell('免转钱包',
                value: '切换场馆，自动到账',
                switchWidget: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 20.h),
                    child: Transform.scale(
                      scale: .9,
                      child: Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (bool value) {}),
                    )))
          ],
        ));
  }

  /// cell2
  Widget _buildCells2() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6).r,
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: _buildCell('银行卡管理', value: '用于人民币提现'),
            ),
          ],
        ));
  }

  Widget _buildFirstCells() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6).r,
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: _buildCell('手机号码', value: '用于找回密码'),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: _buildCell('邮箱地址'),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                RoutesUtil.pushNamed(context, HomeRouter.settingPassword);
              },
              child: _buildCell('修改密码', value: '用于账号登录'),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: _buildCell('邮箱地址', value: '用于取款验证'),
            ),
          ],
        ));
  }

  /// cell
  Widget _buildCell(String label, {String value = '', Widget? switchWidget}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10).r,
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 14.sp, color: IbookTheme.defaultTextColor)),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  value.isNotEmpty
                      ? Text(value,
                          style: TextStyle(
                              color: IbookTheme.grayColor1, fontSize: 14.sp))
                      : const SizedBox(),
                  6.horizontalSpace,
                  switchWidget ??
                      Image.asset(IbookIcons.globalArrowRight,
                          width: 12.w, height: 12.w)
                ],
              ))
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('个人设置'),
    );
  }
}
