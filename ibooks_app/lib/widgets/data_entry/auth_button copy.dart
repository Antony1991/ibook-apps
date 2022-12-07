/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 13:31:55
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 14:39:37
 * @FilePath: /ibook-apps/ibooks_app/lib/widgets/data_entry/auth_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool disabled;
  const AuthButton(this.text, {Key? key, this.onTap, this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () {},
    //   style: ButtonStyle(
    //       shape: MaterialStateProperty.all(
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //         borderRadius: const BorderRadius.all(Radius.circular(50)),
    //         gradient: LinearGradient(
    //             colors: [Theme.of(context).primaryColor, Colors.white])),
    //     padding: const EdgeInsets.all(10),
    //     child: Text(text, style: const TextStyle(fontSize: 20)),
    //   ),
    // );
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 255, 128, 173),
                    Theme.of(context).primaryColor
                  ])),
          child: Opacity(
              opacity: disabled ? 0.4 : 1,
              child: InkWell(
                onTap: disabled ? null : onTap,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 46,
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ))),
    );
  }
}
