import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';

class QuickMoneyList extends StatelessWidget {
  final List<String>? list;
  const QuickMoneyList({this.list, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = list ?? ['1256', '2959', '5351', '7356', '7979'];
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .map((e) => Container(
                  width: 60.w,
                  height: 28.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(IbookIcons.depositQkMoneyBg))),
                  child: Text(
                    e,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
