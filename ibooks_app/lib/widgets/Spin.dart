/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-09 13:35:35
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-09 13:46:13
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/Spin.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';

class Spin extends StatelessWidget {
  const Spin({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: 1,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 72.w,
          height: 72.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color.fromRGBO(27, 30, 42, .5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(IbookIcons.globalSpin, width: 40.w, height: 30.h),
              Text(
                '-IBOOK.COM',
                style: TextStyle(
                    color: const Color.fromRGBO(171, 175, 177, 1),
                    fontSize: 10.sp),
              )
            ],
          ),
        ));
  }
}
