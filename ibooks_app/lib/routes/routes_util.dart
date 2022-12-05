/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 15:31:51
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 15:34:38
 * @FilePath: /ibook-apps/ibooks_app/lib/routes/routes_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class RoutesUtil {
  static pushNamed(BuildContext context, String routeName,
      [Object? arguments]) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
