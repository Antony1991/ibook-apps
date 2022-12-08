/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 09:21:57
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 12:30:33
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/profile/Widgets/UserInfo.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/model/UserInfoModal.dart';
import 'package:ibooks_app/styles/theme.dart';

class UserInfo extends StatelessWidget {
  final UserInfoModal userInfo;
  const UserInfo(this.userInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: IbookTheme.whiteColorAppbar,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userInfo.userprofile),
          ),
          Expanded(flex: 1, child: _buildDes(userInfo))
        ],
      ),
    );
  }

  // 渲染描述
  Widget _buildDes(UserInfoModal userInfo) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userInfo.name,
              style: TextStyle(
                  color: IbookTheme.defaultTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '您已加入IBOOK',
                  style: TextStyle(
                      color: IbookTheme.defaultTextColor, fontSize: 12.sp)),
              TextSpan(
                  text: ' ${userInfo.days} ',
                  style: TextStyle(
                      color: IbookTheme.defaultTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp)),
              TextSpan(
                  text: '天',
                  style: TextStyle(
                      color: IbookTheme.defaultTextColor, fontSize: 12.sp))
            ]))
          ],
        ));
  }
}
