/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-09 16:02:42
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-09 16:35:34
 * @FilePath: /ibook-apps/ibooks_app/lib/provider/deposit_provider.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibooks_app/model/DepositChannelModal.dart';

class DepositProvider extends ChangeNotifier {
  List<DepositChannelModal> depositChannelList = [];

  /// 获取普通存款通道
  Future initDepositChannelList() async {
    depositChannelList = [];
    rootBundle.loadString('assets/json/deposit_channel.json').then((value) {
      var res = json.decode(value);
      for (var element in (res['data'])) {
        depositChannelList.add(DepositChannelModal.fromJson(element));
      }
      notifyListeners();
    });
  }
}
