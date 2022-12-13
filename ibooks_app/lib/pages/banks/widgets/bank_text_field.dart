import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

class BankTextField extends StatefulWidget {
  final String? prefixText;
  final String? hintText;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final bool? showEye;
  const BankTextField(
      {this.textDirection = TextDirection.rtl,
      this.prefixText,
      this.hintText,
      this.showEye = false,
      this.textAlign = TextAlign.end,
      Key? key})
      : super(key: key);

  @override
  State<BankTextField> createState() => _BankTextFieldState();
}

class _BankTextFieldState extends State<BankTextField> {
  bool showEye = false;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40.h),
      child: TextField(
        obscureText: widget.showEye! ? !showEye : false,
        textAlign: widget.textAlign!,
        style: TextStyle(fontSize: 14.sp, color: IbookTheme.defaultTextColor),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: IbookTheme.grayColor3, fontSize: 14.sp),
            contentPadding: const EdgeInsets.symmetric(vertical: 20).r,
            prefixIcon: widget.prefixText != null
                ? Container(
                    width: 80.w,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 6).r,
                    child: Text(
                      widget.prefixText!,
                      style: TextStyle(
                          fontSize: 14.sp, color: IbookTheme.defaultTextColor),
                    ),
                  )
                : const SizedBox(),
            suffixIcon: widget.showEye!
                ? Padding(
                    padding: const EdgeInsets.only(left: 10).r,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            showEye = !showEye;
                          });
                        },
                        child: Image.asset(
                            showEye
                                ? IbookIcons.globalEyeOpen
                                : IbookIcons.globalEyeClose,
                            width: 22.w,
                            height: 22.w)))
                : const SizedBox(),
            suffixIconConstraints: const BoxConstraints(),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
