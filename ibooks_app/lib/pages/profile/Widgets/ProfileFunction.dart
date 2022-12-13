/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 16:34:55
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 17:17:06
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/profile/Widgets/ProfileFunction.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/util/toast_util.dart';

class ProfileFunction extends StatelessWidget {
  const ProfileFunction({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FunctionItemModal> lists = [
      FunctionItemModal('投注记录', IbookIcons.profile_bet_ic),
      FunctionItemModal('交易记录', IbookIcons.profile_record_ic),
      FunctionItemModal('邀请奖励', IbookIcons.profile_share_ic),
      FunctionItemModal('福利中心', IbookIcons.profile_welfare_ic),
      FunctionItemModal('意见反馈', IbookIcons.profile_feedback_ic),
      FunctionItemModal('个人资料', IbookIcons.profile_userinfo_ic),
      FunctionItemModal('加入我们', IbookIcons.profile_join_ic),
      FunctionItemModal('关于我们', IbookIcons.profile_about_ic),
      FunctionItemModal('BOB综合', IbookIcons.profile_compre_ic),
      FunctionItemModal('BOB体育', IbookIcons.profile_sport_ic),
      FunctionItemModal('红包', IbookIcons.profile_redwall_ic),
      FunctionItemModal('直播', IbookIcons.profile_live_ic),
      FunctionItemModal('设置', IbookIcons.profile_setting_ic),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lists.length,
      itemBuilder: ((context, index) {
        FunctionItemModal item = lists[index];
        return GestureDetector(
          onTap: () {
            if (item.label == '投注记录' || item.label == '交易记录') {
              RoutesUtil.pushNamed(context, HomeRouter.bettingRecord);
            } else if (item.label == '设置') {
              RoutesUtil.pushNamed(context, HomeRouter.setting);
            } else if (item.label == '意见反馈') {
              RoutesUtil.pushNamed(context, HomeRouter.feedBack);
            } else if (item.label == '个人资料') {
              RoutesUtil.pushNamed(context, HomeRouter.profileUserInfo);
            } else {
              ToastUtil.show('功能开发中!');
            }
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(item.value, width: 24.w, height: 24.h),
                4.verticalSpace,
                Text(
                  item.label,
                  style: TextStyle(
                      fontSize: 12.sp, color: IbookTheme.tabbarTextColor),
                )
              ]),
        );
      }),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    );
  }
}

class FunctionItemModal {
  final String label;
  final String value;
  FunctionItemModal(this.label, this.value);
}
