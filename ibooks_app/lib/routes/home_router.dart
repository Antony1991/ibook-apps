/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 15:35:17
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 21:00:37
 * @FilePath: /ibook-apps/ibooks_app/lib/routes/auth_router.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/pages/deposit/deposit_page.dart';
import 'package:ibooks_app/pages/discount/discount_detail_page.dart';
import 'package:ibooks_app/pages/index/index_route.dart';
import 'package:ibooks_app/pages/withdrawal/withdrawal_page.dart';

class HomeRouter {
  /// 首页
  static String home = '/';
  static String discountDetail = '/discount/detail';
  static String deposit = '/deposit';
  static String withdrawal = '/withdrawal';
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      home: (context) => const IndexRoute(),
      discountDetail: (context) => const DiscountDetailPage(),
      deposit: (context) => const DepositPage(),
      withdrawal: (context) => const WithdrawalPage()
    };
  }
}
