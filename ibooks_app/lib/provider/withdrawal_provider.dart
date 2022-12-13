import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibooks_app/model/WithdrawalVenueModal.dart';

class WithdrawalProvider extends ChangeNotifier {
  List<WithdrawalVenueModal> veneues = [];

  Future initVenueList() async {
    veneues = [];
    rootBundle.loadString('assets/json/withdrawal_venues.json').then((value) {
      var res = json.decode(value);
      for (var element in res['data']['data']) {
        veneues.add(WithdrawalVenueModal.fromJson(element));
      }
      notifyListeners();
    });
  }
}
