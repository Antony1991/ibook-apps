import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

class DepositButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const DepositButton(this.text, {this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 8).r,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(IbookIcons.depositActiveTabbg))),
        child: Text(
          text,
          style: TextStyle(fontSize: 12.sp, color: IbookTheme.whiteColor),
        ),
      ),
    );
  }
}
