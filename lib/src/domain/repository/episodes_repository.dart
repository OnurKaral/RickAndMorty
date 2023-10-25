import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/entities/EpisodesResponseEntity.dart';

abstract class EpisodesRepository {
  Future<EpisodesResponseEntity> getAllEpisodes();
}
