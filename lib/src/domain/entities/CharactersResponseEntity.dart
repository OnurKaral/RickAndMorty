import 'package:rick_and_morty_app/src/domain/entities/PlayerEntity.dart';

class CharactersResponseEntity {
  const CharactersResponseEntity({this.data});

  final List<CharacterEntity>? data;
}
