/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-07 20:24:52
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 20:34:22
 * @FilePath: /ibook-apps/ibooks_app/lib/model/SponsorModal.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'SponsorModal.g.dart';

@JsonSerializable()
class SponsorModal {
  final String cover_img_day;
  final String end_at;
  final String keyword;
  final String link_url;
  final String start_at;
  final String title;
  SponsorModal(
      {required this.cover_img_day,
      required this.end_at,
      required this.keyword,
      required this.link_url,
      required this.start_at,
      required this.title});
  factory SponsorModal.fromJson(Map<String, dynamic> json) =>
      _$SponsorModalFromJson(json);
  Map<String, dynamic> toJson() => _$SponsorModalToJson(this);
}
