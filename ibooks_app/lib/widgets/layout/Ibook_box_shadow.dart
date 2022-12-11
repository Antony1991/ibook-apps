/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 16:20:42
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 16:33:06
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/layout/Ibook_box_shadow.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/theme.dart';

class IbookBoxShadow extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  const IbookBoxShadow(
      {required this.child, this.padding, this.margin, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: IbookTheme.whiteColorAppbar,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 206, 211, 219),
                blurRadius: 5,
                offset: Offset(1, 3))
          ],
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
      child: child,
    );
  }
}
