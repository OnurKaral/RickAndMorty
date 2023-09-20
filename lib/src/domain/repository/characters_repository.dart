import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';

abstract class CharactersRepository {
  Future<CharactersResponseEntity> getAllCharacters();
}
