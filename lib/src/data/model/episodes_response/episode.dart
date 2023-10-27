import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/src/domain/entities/EpisodeEntity.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final DateTime? created;

  const Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  EpisodeEntity toEntity() {
    return EpisodeEntity(
        id: id,
        name: name,
        airDate: airDate,
        episode: episode,
        characters: characters,
        url: url,
        created: created);
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      airDate,
      episode,
      characters,
      url,
      created,
    ];
  }
}
