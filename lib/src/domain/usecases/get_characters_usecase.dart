import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';

class GetAllCharactersUseCase {
  final CharactersRepository repository;

  GetAllCharactersUseCase(this.repository);

  Future<CharactersResponseEntity> getAllCharacters() {
    return repository.getAllCharacters();
  }
}
