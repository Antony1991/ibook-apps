/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 09:45:06
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 11:18:49
 * @FilePath: /ibook-apps/ibooks_app/lib/provider/user_provider.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibooks_app/model/UserInfoModal.dart';

class UserProvider extends ChangeNotifier {
  UserInfoModal? userInfo;

  Future initUserInfo() async {
    rootBundle.loadString('assets/json/userinfo.json').then((value) {
      userInfo = UserInfoModal.fromJson(json.decode(value)['data']);
      notifyListeners();
    });
  }
}
