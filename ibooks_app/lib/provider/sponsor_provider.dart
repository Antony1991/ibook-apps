/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-07 20:36:52
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 20:41:33
 * @FilePath: /ibook-apps/ibooks_app/lib/provider/sponsor_provider.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibooks_app/model/SponsorModal.dart';

class SponsorProvider extends ChangeNotifier {
  List<SponsorModal> sponsorList = [];

  Future initSponsorList() async {
    rootBundle.loadString('assets/json/sponsor.json').then((value) {
      var res = json.decode(value);
      for (var element in res['data']) {
        sponsorList.add(SponsorModal.fromJson(element));
      }
      notifyListeners();
    });
  }
}
