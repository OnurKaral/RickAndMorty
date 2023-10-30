import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/search_characters_repository.dart';

class GetSearchCharactersUseCase {
  final SearchCharactersRepository repository;
  final String gender;
  final String status;

  GetSearchCharactersUseCase(this.repository, this.gender, this.status);

  Future<CharactersResponseEntity> getSearchedCharacters() {
    return repository.searchCharacters(gender, status);
  }
}
