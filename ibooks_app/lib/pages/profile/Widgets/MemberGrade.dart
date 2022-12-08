/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 13:14:41
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 15:41:25
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/profile/Widgets/MemberGrade.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

class MemberGrade extends StatefulWidget {
  const MemberGrade({super.key});

  @override
  State<MemberGrade> createState() => _MemberGradeState();
}

class _MemberGradeState extends State<MemberGrade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Column(
        children: [
          _buildUpText(),
          _buildGrade(),
          _buildGradeStatus(),
          _buildUsdtUrl()
        ],
      ),
    );
  }

  /// 虚拟币充值
  Widget _buildUsdtUrl() {
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        height: 37.h,
        child: Image.asset(
          IbookIcons.profileUsdtBanner,
          width: double.infinity,
          height: 37.h,
        ),
      ),
      onTap: () {},
    );
  }

  /// 等级状态
  Widget _buildGradeStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGradeStatusItem('晋级礼金', IbookIcons.profileGradeCheckbg, true),
        _buildGradeStatusItem('每周红包', IbookIcons.profileGradeWrongbg, false),
        _buildGradeStatusItem('生日礼金', IbookIcons.profileGradeWrongbg, false),
        _buildGradeStatusItem('专属豪礼', IbookIcons.profileGradeWrongbg, false),
      ],
    );
  }

  Widget _buildGradeStatusItem(String text, String bgImgName, bool isCheck) {
    return Container(
        width: 78.w,
        height: 26.h,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(bgImgName))),
        child: Stack(
          children: [
            Positioned(
              left: 26.r,
              top: 7.r,
              child: Text(text,
                  style: TextStyle(
                      color: isCheck
                          ? Theme.of(context).primaryColor
                          : IbookTheme.gradeDefaultTextColor,
                      fontSize: 10.sp)),
            )
          ],
        ));
  }

  /// 渲染等级
  Widget _buildGrade() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(IbookIcons.profileVip0, width: 52.w, height: 16.h),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.r),
                  child: Stack(
                    children: [
                      Image.asset(IbookIcons.profileDefProgress, height: 10.h)
                    ],
                  ))),
          Image.asset(IbookIcons.profileVip1, width: 52.w, height: 16.h)
        ],
      ),
    );
  }

  // 渲染晋级流水
  Widget _buildUpText() {
    return Container(
      width: 170.w,
      margin: const EdgeInsets.symmetric(vertical: 4).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          color: IbookTheme.whiteColorAppbar,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(220, 233, 252, 1),
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
      alignment: Alignment.center,
      child: Text('晋级需要¥4000.00元流水',
          style: TextStyle(
              fontSize: 12.sp, color: IbookTheme.gradeDefaultTextColor)),
    );
  }
}
