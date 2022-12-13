import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/banks/widgets/bank_text_field.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class SettingPasswordPage extends StatefulWidget {
  const SettingPasswordPage({super.key});

  @override
  State<SettingPasswordPage> createState() => _SettingPasswordPageState();
}

class _SettingPasswordPageState extends State<SettingPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
          child: ListView(
        padding: const EdgeInsets.all(10).r,
        children: [
          IbookBoxShadow(
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              child: const BankTextField(
                  prefixText: '原始密码', hintText: '请输入原始密码', showEye: true)),
          10.verticalSpace,
          IbookBoxShadow(
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              child: const BankTextField(
                  prefixText: '新密码', hintText: '请输入新密码', showEye: true)),
          10.verticalSpace,
          IbookBoxShadow(
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              child: const BankTextField(
                  prefixText: '确认新密码', hintText: '请输入确认新密码', showEye: true)),
          20.verticalSpace,
          _buildBindBtn()
        ],
      )),
    );
  }

  /// bind btn
  Widget _buildBindBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10, bottom: 15).r,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(IbookIcons.depositActiveTabbg))),
        child: Text(
          '提交',
          style: TextStyle(fontSize: 16.sp, color: IbookTheme.whiteColor),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('修改密码'),
    );
  }
}
