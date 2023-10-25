// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesResponse _$EpisodesResponseFromJson(Map<String, dynamic> json) =>
    EpisodesResponse(
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodesResponseToJson(EpisodesResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
