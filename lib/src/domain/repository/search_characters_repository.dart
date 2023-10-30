import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';

abstract class SearchRepository {
  Future<CharactersResponseEntity> searchCharacters(
      String gender, String status);
}
