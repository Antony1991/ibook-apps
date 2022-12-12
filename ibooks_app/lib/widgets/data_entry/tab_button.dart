/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 21:28:31
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 22:31:16
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/data_entry/tab_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

class TabButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isActive;
  const TabButton(this.text, {this.isActive = false, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 160.w,
        padding: const EdgeInsets.only(top: 7, bottom: 12).r,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(isActive
                    ? IbookIcons.depositActiveTabbg
                    : IbookIcons.depositTabbg))),
        // borderRadius: BorderRadius.circular(6.r),
        // color: isActive
        //     ? Theme.of(context).primaryColor
        //     : IbookTheme.whiteColor,
        // boxShadow: const [
        //   BoxShadow(
        //       color: Color.fromRGBO(0, 0, 0, .2),
        //       blurRadius: 4,
        //       offset: Offset(1, 3))
        // ]),
        child: Text(
          text,
          style: TextStyle(
              color: isActive ? IbookTheme.whiteColor : IbookTheme.grayColor,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
