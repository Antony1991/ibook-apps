/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-09 15:39:52
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-09 16:49:38
 * @FilePath: /ibook-apps/ibooks_app/lib/model/DepositChannelModal.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:json_annotation/json_annotation.dart';

part 'DepositChannelModal.g.dart';

@JsonSerializable()
class DepositChannelModal {
  final String android_icon;
  final String android_icon_chosen;
  final String? bank_name;
  final String card_name;
  final String? day_max_discount;
  final String fyAliStatus;
  final String hint;
  final String ios_icon;
  final String ios_icon_chosen;
  final String isRecommend;
  final String? max_money;
  final String? min_money;
  final String? obt_type;
  final String on_line;
  final String? percent;
  final String rate;
  final String text;
  final String type;
  final Recommend recommend;
  DepositChannelModal(
      {required this.android_icon,
      required this.android_icon_chosen,
      this.bank_name,
      required this.card_name,
      this.day_max_discount,
      required this.fyAliStatus,
      required this.hint,
      required this.ios_icon,
      required this.ios_icon_chosen,
      required this.isRecommend,
      this.max_money,
      this.min_money,
      this.obt_type,
      required this.on_line,
      this.percent,
      required this.rate,
      required this.recommend,
      required this.text,
      required this.type});

  factory DepositChannelModal.fromJson(Map<String, dynamic> json) =>
      _$DepositChannelModalFromJson(json);

  Map<String, dynamic> toJson() => _$DepositChannelModalToJson(this);
}

@JsonSerializable()
class Recommend {
  final String icon_url;
  final String copywriting;
  final String download_url;
  Recommend(
      {required this.icon_url,
      required this.copywriting,
      required this.download_url});
  factory Recommend.fromJson(Map<String, dynamic> json) =>
      _$RecommendFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendToJson(this);
}
