import 'package:rick_and_morty_app/src/data/model/characters_response/characters_response.dart';
import 'package:rick_and_morty_app/src/data/model/characters_response/result.dart';
import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl({required this.apiService});

  final ApiService apiService;
  int page = 1;
  var oldResponse = const CharactersResponse();

  @override
  Future<CharactersResponseEntity> getAllCharacters() async {
    try {
      var response = await apiService.getAllCharacters(page);
      if (page > 1) {
        oldResponse.results?.addAll(response.results as Iterable<Result>);
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
