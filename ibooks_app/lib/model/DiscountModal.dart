/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-07 13:15:49
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 14:56:59
 * @FilePath: /ibook-apps/ibooks_app/lib/model/DiscountModal.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:json_annotation/json_annotation.dart';

part 'DiscountModal.g.dart';

@JsonSerializable()
class DiscountModal {
  int type;
  int id;
  String startAt;
  String endAt;
  int tag;
  String title;
  String h5ListImgPath;
  String content;
  DiscountModal(
      {required this.type,
      required this.id,
      required this.startAt,
      required this.endAt,
      required this.tag,
      required this.title,
      required this.h5ListImgPath,
      required this.content});

  factory DiscountModal.fromJson(Map<String, dynamic> json) =>
      _$DiscountModalFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountModalToJson(this);
}
