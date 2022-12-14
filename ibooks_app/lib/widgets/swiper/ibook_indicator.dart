/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 20:18:03
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-06 13:40:32
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/swiper/ibook_indicator.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/theme.dart';

class IbookIndicator extends StatelessWidget {
  // 下标
  final int currentIndex;
  final int itemCount;
  const IbookIndicator(
      {Key? key, required this.currentIndex, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      // height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(itemCount, (index) {
          return currentIndex == index
              ? Container(
                  width: 18.w,
                  height: 4.w,
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                      color: IbookTheme.defaultTextColor.withOpacity(.7),
                      borderRadius: BorderRadius.circular(5.r)),
                )
              : Container(
                  width: 4.w,
                  height: 4.w,
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                      color: IbookTheme.tabbarTextColor.withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.r)));
        }),
      ),
    );
  }
}
