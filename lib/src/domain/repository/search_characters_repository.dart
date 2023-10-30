import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';

abstract class SearchCharactersRepository {
  Future<CharactersResponseEntity> searchCharacters(String gender, String status);
}
