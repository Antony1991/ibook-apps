// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DepositChannelModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositChannelModal _$DepositChannelModalFromJson(Map<String, dynamic> json) =>
    DepositChannelModal(
      android_icon: json['android_icon'] as String,
      android_icon_chosen: json['android_icon_chosen'] as String,
      bank_name: json['bank_name'] as String?,
      card_name: json['card_name'] as String,
      day_max_discount: json['day_max_discount'] as String?,
      fyAliStatus: json['fyAliStatus'] as String,
      hint: json['hint'] as String,
      ios_icon: json['ios_icon'] as String,
      ios_icon_chosen: json['ios_icon_chosen'] as String,
      isRecommend: json['isRecommend'] as String,
      max_money: json['max_money'] as String?,
      min_money: json['min_money'] as String?,
      obt_type: json['obt_type'] as String?,
      on_line: json['on_line'] as String,
      percent: json['percent'] as String?,
      rate: json['rate'] as String,
      recommend: Recommend.fromJson(json['recommend'] as Map<String, dynamic>),
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DepositChannelModalToJson(
        DepositChannelModal instance) =>
    <String, dynamic>{
      'android_icon': instance.android_icon,
      'android_icon_chosen': instance.android_icon_chosen,
      'bank_name': instance.bank_name,
      'card_name': instance.card_name,
      'day_max_discount': instance.day_max_discount,
      'fyAliStatus': instance.fyAliStatus,
      'hint': instance.hint,
      'ios_icon': instance.ios_icon,
      'ios_icon_chosen': instance.ios_icon_chosen,
      'isRecommend': instance.isRecommend,
      'max_money': instance.max_money,
      'min_money': instance.min_money,
      'obt_type': instance.obt_type,
      'on_line': instance.on_line,
      'percent': instance.percent,
      'rate': instance.rate,
      'text': instance.text,
      'type': instance.type,
      'recommend': instance.recommend,
    };

Recommend _$RecommendFromJson(Map<String, dynamic> json) => Recommend(
      icon_url: json['icon_url'] as String,
      copywriting: json['copywriting'] as String,
      download_url: json['download_url'] as String,
    );

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'icon_url': instance.icon_url,
      'copywriting': instance.copywriting,
      'download_url': instance.download_url,
    };
