import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/search_characters_repository.dart';

class GetSearchCharactersUseCase {
  final SearchRepository repository;

  GetSearchCharactersUseCase(this.repository);

  Future<CharactersResponseEntity> getSearchedCharacters(
      String gender, String status) {
    return repository.searchCharacters(gender, status);
  }
}
