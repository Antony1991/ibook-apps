import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/banks/widgets/bank_text_field.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class BindBankPage extends StatefulWidget {
  const BindBankPage({super.key});

  @override
  State<BindBankPage> createState() => _BindBankPageState();
}

class _BindBankPageState extends State<BindBankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
        onRefresh: () {},
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10).r,
          children: [
            _buildName(),
            _buildNameHint(),
            _buildBankNo(),
            10.verticalSpace,
            _buildPhone(),
            _buildPhoneHint(),
            20.verticalSpace,
            _buildBindBtn(),
            _buildBtnHint()
          ],
        ),
      ),
    );
  }

  /// btn hint
  Widget _buildBtnHint() {
    return Container(
      margin: const EdgeInsets.only(top: 1).r,
      child: Text('请认真校对银行卡卡号，卡号错误资金将无法到账。 经过云加密的银行卡系统，全面保障您的用卡安全。 有任何疑问请 ',
          maxLines: 3,
          style: TextStyle(color: IbookTheme.grayColor3, fontSize: 12.sp)),
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
          '绑定',
          style: TextStyle(fontSize: 16.sp, color: IbookTheme.whiteColor),
        ),
      ),
    );
  }

  /// phone hint
  Widget _buildPhoneHint() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 15).r,
      child: Text('手机号码会帮助您找回账号，并是客服确认您身份的重要凭证。',
          maxLines: 2,
          style: TextStyle(color: IbookTheme.grayColor3, fontSize: 12.sp)),
    );
  }

  /// phone
  Widget _buildPhone() {
    return IbookBoxShadow(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6).r,
      child: Column(
        children: const [
          BankTextField(prefixText: '手机号码', hintText: '请输入手机号码'),
          Divider(),
          BankTextField(prefixText: '验证码', hintText: '请输入验证码')
        ],
      ),
    );
  }

  /// bankno
  Widget _buildBankNo() {
    return IbookBoxShadow(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6).r,
      child: Column(
        children: [
          _buildBankAddress(),
          const Divider(),
          const BankTextField(prefixText: '银行卡号', hintText: '请输入银行卡号')
        ],
      ),
    );
  }

  /// bank address
  Widget _buildBankAddress() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10).r,
        child: Row(
          children: [
            Text(
              '开户行',
              style: TextStyle(
                  color: IbookTheme.defaultTextColor, fontSize: 14.sp),
            ),
            Expanded(
                child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10).r,
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text('取消'),
                                      Expanded(child: Text('请选择开户银行')),
                                      Text('确定')
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('请选择银行卡名称',
                            style: TextStyle(
                                color: IbookTheme.grayColor3, fontSize: 14.sp)),
                        SizedBox(width: 10.w),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: IbookTheme.grayColor3,
                          size: 12.sp,
                        )
                      ],
                    )))
          ],
        ));
  }

  /// name hint
  Widget _buildNameHint() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 15).r,
      child: Text('为了您的资金能够迅速到账，请确保填写的姓名与银行卡的开户姓名一致。目前仅支持中文、英文和“·”。',
          maxLines: 2,
          style: TextStyle(color: IbookTheme.grayColor3, fontSize: 12.sp)),
    );
  }

  Widget _buildName() {
    return IbookBoxShadow(
      margin: const EdgeInsets.only(top: 10).r,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6).r,
      child: const BankTextField(
        prefixText: '真实姓名',
        hintText: '请输入开户姓名',
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('绑定银行卡'),
    );
  }
}
