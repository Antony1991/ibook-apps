/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 12:48:12
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-06 17:50:39
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/data_entry/auth_textfield.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 登录注册的textField
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/theme.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final String? prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const AuthTextField(
      {Key? key,
      this.prefixIcon,
      this.hintText,
      this.controller,
      this.onChanged,
      this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(fontSize: 12.sp, color: IbookTheme.whiteColor),
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
              padding: EdgeInsets.only(right: 10.r),
              child: ImageIcon(
                AssetImage(prefixIcon!),
                size: 17.sp,
                color: IbookTheme.whiteColor,
              )),
          prefixIconConstraints: const BoxConstraints(),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: IbookTheme.whiteColor)),
          hintStyle: const TextStyle(color: IbookTheme.whiteColor)),
    );
  }
}
