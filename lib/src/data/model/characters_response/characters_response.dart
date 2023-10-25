import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';

import 'character.dart';
import 'info.dart';

part 'characters_response.g.dart';

@JsonSerializable()
class CharactersResponse extends Equatable {
  final Info? info;
  final List<Character>? results;

  const CharactersResponse({this.info, this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return _$CharactersResponseFromJson(json);
  }

  CharactersResponseEntity toEntity() {
    return CharactersResponseEntity(
        data: results?.map((e) => e.toEntity()).toList());
  }

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);

  @override
  List<Object?> get props => [info, results];
}
