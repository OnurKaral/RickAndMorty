import 'package:rick_and_morty_app/src/data/model/characters_response/character.dart';
import 'package:rick_and_morty_app/src/data/model/characters_response/characters_response.dart';
import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';
import 'package:rick_and_morty_app/src/domain/repository/search_characters_repository.dart';

class SearchRepositoryImpl implements SearchCharactersRepository {
  SearchRepositoryImpl({required this.apiService});

  final ApiService apiService;
  int page = 1;
  var oldResponse = const CharactersResponse();

  @override
  Future<CharactersResponseEntity> searchCharacters(String gender, String status) async {
    try {
      var response = await apiService.searchCharacter(page, gender, status);
      if (page > 1) {
        oldResponse.results?.addAll(response.results as Iterable<Character>);
      } else {
        oldResponse = response;
      }
      page++;

      final entity = oldResponse.toEntity();
      return entity;
    } catch (e) {
      rethrow;
    }
  }
}
