/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 09:30:44
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 11:15:07
 * @FilePath: /ibook-apps/ibooks_app/lib/model/UserInfoModal.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:json_annotation/json_annotation.dart';

part 'UserInfoModal.g.dart';

@JsonSerializable()
class UserInfoModal {
  final String address;
  final String birth;
  final String chess_photo;
  final String completed_recharge;
  final String completed_record;
  final String created_at;
  final String days;
  final String email;
  final String gender;
  final String grade;
  final bool has_bank;
  final bool has_qk_pwd;
  final int id;
  final String ids;
  final bool invite_off;
  final bool invite_spring_off;
  final bool is_daili;
  final bool is_wallet;
  final bool large_pay_off;
  final String money;
  final String name;
  final int not_read_message_count;
  final String phone;
  final String real_name;
  final String token;
  final String userprofile;
  final String verifyType;

  UserInfoModal(
      {required this.address,
      required this.birth,
      required this.chess_photo,
      required this.completed_recharge,
      required this.completed_record,
      required this.created_at,
      required this.days,
      required this.email,
      required this.gender,
      required this.grade,
      required this.has_bank,
      required this.has_qk_pwd,
      required this.id,
      required this.ids,
      required this.invite_off,
      required this.invite_spring_off,
      required this.is_daili,
      required this.is_wallet,
      required this.large_pay_off,
      required this.money,
      required this.name,
      required this.not_read_message_count,
      required this.phone,
      required this.real_name,
      required this.token,
      required this.userprofile,
      required this.verifyType});
  factory UserInfoModal.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModalFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModalToJson(this);
}
