import 'package:rick_and_morty_app/src/data/model/characters_response/character.dart';
import 'package:rick_and_morty_app/src/data/model/characters_response/characters_response.dart';
import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/search_characters_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required this.apiService});

  final ApiService apiService;
  var oldResponse = const CharactersResponse();

  @override
  Future<CharactersResponseEntity> searchCharacters(
      String gender, String status) async {
    try {
      var response = await apiService.searchCharacter(gender, status);

      oldResponse.results?.addAll(response.results as Iterable<Character>);

      final entity = oldResponse.toEntity();
      return entity;
    } catch (e) {
      rethrow;
    }
  }
}
