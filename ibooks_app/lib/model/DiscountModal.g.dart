// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DiscountModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscountModal _$DiscountModalFromJson(Map<String, dynamic> json) =>
    DiscountModal(
      type: json['type'] as int,
      id: json['id'] as int,
      startAt: json['startAt'] as String,
      endAt: json['endAt'] as String,
      tag: json['tag'] as int,
      title: json['title'] as String,
      h5ListImgPath: json['h5ListImgPath'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$DiscountModalToJson(DiscountModal instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'tag': instance.tag,
      'title': instance.title,
      'h5ListImgPath': instance.h5ListImgPath,
      'content': instance.content,
    };
