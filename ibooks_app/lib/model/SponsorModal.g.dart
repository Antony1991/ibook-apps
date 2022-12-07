// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SponsorModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorModal _$SponsorModalFromJson(Map<String, dynamic> json) => SponsorModal(
      cover_img_day: json['cover_img_day'] as String,
      end_at: json['end_at'] as String,
      keyword: json['keyword'] as String,
      link_url: json['link_url'] as String,
      start_at: json['start_at'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$SponsorModalToJson(SponsorModal instance) =>
    <String, dynamic>{
      'cover_img_day': instance.cover_img_day,
      'end_at': instance.end_at,
      'keyword': instance.keyword,
      'link_url': instance.link_url,
      'start_at': instance.start_at,
      'title': instance.title,
    };
