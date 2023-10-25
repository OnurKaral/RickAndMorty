import 'package:rick_and_morty_app/src/data/model/characters_response/characters_response.dart';
import 'package:rick_and_morty_app/src/data/model/characters_response/character.dart';
import 'package:rick_and_morty_app/src/data/model/episodes_response/episodes_response.dart';
import 'package:rick_and_morty_app/src/data/model/episodes_response/episode.dart';
import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/entities/EpisodesResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';
import 'package:rick_and_morty_app/src/domain/repository/episodes_repository.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  EpisodesRepositoryImpl({required this.apiService});

  final ApiService apiService;
  int page = 1;
  var oldResponse = const EpisodesResponse();

  @override
  Future<EpisodesResponseEntity> getAllEpisodes() async {
    try {
      var response = await apiService.getAllEpisodes(page);
      if (page > 1) {
        oldResponse.results?.addAll(response.results as Iterable<Episode> );
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
