/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 12:48:12
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 18:07:25
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/data_entry/auth_textfield.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 登录注册的textField
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final IconData prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const AuthTextField(
      {Key? key,
      required this.prefixIcon,
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
      style: const TextStyle(fontSize: 12),
      obscureText: obscureText,
      decoration: InputDecoration(
          isDense: true,
          prefixIconColor: Colors.white,
          iconColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(prefixIcon),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(35))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(35))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(35))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          hintText: hintText),
    );
  }
}
