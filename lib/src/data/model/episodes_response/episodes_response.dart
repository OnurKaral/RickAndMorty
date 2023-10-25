import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/src/domain/entities/EpisodesResponseEntity.dart';

import 'info.dart';
import 'episode.dart';

part 'episodes_response.g.dart';

@JsonSerializable()
class EpisodesResponse extends Equatable {
  final Info? info;
  final List<Episode>? results;

  const EpisodesResponse({this.info, this.results});

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) {
    return _$EpisodesResponseFromJson(json);
  }

  EpisodesResponseEntity toEntity() {
    return EpisodesResponseEntity(
        data: results?.map((e) => e.toEntity()).toList());
  }

  Map<String, dynamic> toJson() => _$EpisodesResponseToJson(this);

  @override
  List<Object?> get props => [info, results];
}
