import 'package:json_annotation/json_annotation.dart';

part 'WithdrawalVenueModal.g.dart';

@JsonSerializable()
class WithdrawalVenueModal {
  final String APIID;
  final String AndroidMaintain;
  final String AndroidsportMaintain;
  final String H5Maintain;
  final String IosMaintain;
  final String IossportMaintain;
  final String JumpH5;
  final String PcMaintain;
  final String android_icon;
  final int api_id;
  final String api_name;
  final String api_title;
  final String balance;
  final String ios_icon;
  final bool is_register;
  final String maintain_endtime;
  final String maintain_starttime;
  final String on_line;
  final String recommend_venue_name;
  final String recommend_venue_title;
  WithdrawalVenueModal(
      {required this.APIID,
      required this.AndroidMaintain,
      required this.AndroidsportMaintain,
      required this.H5Maintain,
      required this.IosMaintain,
      required this.IossportMaintain,
      required this.JumpH5,
      required this.PcMaintain,
      required this.android_icon,
      required this.api_id,
      required this.api_name,
      required this.api_title,
      required this.balance,
      required this.ios_icon,
      required this.is_register,
      required this.maintain_endtime,
      required this.maintain_starttime,
      required this.on_line,
      required this.recommend_venue_name,
      required this.recommend_venue_title});

  factory WithdrawalVenueModal.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalVenueModalFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawalVenueModalToJson(this);
}
