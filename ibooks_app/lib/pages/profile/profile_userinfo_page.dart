import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class ProfileUserInfoPage extends StatefulWidget {
  const ProfileUserInfoPage({super.key});

  @override
  State<ProfileUserInfoPage> createState() => _ProfileUserInfoPageState();
}

class _ProfileUserInfoPageState extends State<ProfileUserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
          child: ListView(
        padding: const EdgeInsets.all(10).r,
        children: [
          _buildFirstCells(),
        ],
      )),
    );
  }

  Widget _buildFirstCells() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6).r,
        child: Column(
          children: [
            _buildCell('账户名称', value: 'chenwen22', showArrow: false),
            const Divider(),
            InkWell(
              onTap: () {},
              child: _buildCell('真实姓名'),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                RoutesUtil.pushNamed(context, HomeRouter.settingPassword);
              },
              child: _buildCell('VIP等级', value: 'VIP0'),
            ),
          ],
        ));
  }

  /// cell
  Widget _buildCell(String label, {String value = '', bool showArrow = true}) {
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
                  showArrow
                      ? Image.asset(IbookIcons.globalArrowRight,
                          width: 12.w, height: 12.w)
                      : const SizedBox()
                ],
              ))
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('个人资料 '),
    );
  }
}
