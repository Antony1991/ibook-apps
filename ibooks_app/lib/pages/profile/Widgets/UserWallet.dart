/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 15:42:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 21:00:47
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/profile/Widgets/UserWallet.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 用户钱包
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

class UserWallet extends StatefulWidget {
  const UserWallet({super.key});

  @override
  State<UserWallet> createState() => _UserWalletState();
}

class _UserWalletState extends State<UserWallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
      margin: const EdgeInsets.symmetric(horizontal: 15).r,
      decoration: BoxDecoration(
          color: IbookTheme.whiteColorAppbar,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 206, 211, 219),
                blurRadius: 5,
                offset: Offset(1, 3))
          ],
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUserInfo(),
          Expanded(flex: 1, child: _buildUserAction()),
        ],
      ),
    );
  }

  /// 渲染用户信息
  Widget _buildUserInfo() {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('中心钱包：',
                  style: TextStyle(
                      fontSize: 12.sp, color: IbookTheme.defaultTextColor)),
              5.horizontalSpace,
              Image.asset(IbookIcons.profileVip0, width: 52.w, height: 16.h)
            ],
          ),
          Text(
            '¥0.00',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: IbookTheme.defaultTextColor),
          ),
        ],
      ),
    );
  }

  /// 渲染单个action
  Widget _buildActionItem(String label, String iconName) {
    return GestureDetector(
      onTap: () {
        if (label == '存款') {
          RoutesUtil.pushNamed(context, HomeRouter.deposit);
        } else if (label == '取款') {
          RoutesUtil.pushNamed(context, HomeRouter.withdrawal);
        } else if (label == '会员') {
          RoutesUtil.pushNamed(context, HomeRouter.member);
        }
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            children: [
              Image.asset(
                iconName,
                width: 24.sp,
                height: 24.sp,
                fit: BoxFit.contain,
              ),
              4.verticalSpace,
              Text(label,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.r))
            ],
          )),
    );
  }

  /// 渲染用户action
  Widget _buildUserAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionItem('存款', IbookIcons.homeUserDisposit),
        _buildActionItem('取款', IbookIcons.homeUserWithdrawal),
        _buildActionItem('转账', IbookIcons.homeUserTransfer),
        _buildActionItem('会员', IbookIcons.homeUserVip),
      ],
    );
  }
}
