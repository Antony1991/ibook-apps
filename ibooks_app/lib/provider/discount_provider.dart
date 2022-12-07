/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-07 15:33:09
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 16:36:31
 * @FilePath: /ibook-apps/ibooks_app/lib/provider/discount_provider.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibooks_app/model/DiscountModal.dart';

class DiscountProvider extends ChangeNotifier {
  List<DiscountModal> activityList = [];

  Future initActivityList() async {
    rootBundle.loadString('assets/json/discount.json').then((value) {
      var res = json.decode(value);
      for (var element in (res['data'])) {
        activityList.add(DiscountModal.fromJson(element));
      }
      notifyListeners();
    });
  }
}
