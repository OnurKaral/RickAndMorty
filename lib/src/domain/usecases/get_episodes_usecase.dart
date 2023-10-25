import 'package:rick_and_morty_app/src/domain/entities/EpisodesResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/episodes_repository.dart';

class GetAllEpisodesUseCase {
  final EpisodesRepository repository;

  GetAllEpisodesUseCase(this.repository);

  Future<EpisodesResponseEntity> getAllEpisodes() {
    return repository.getAllEpisodes();
  }
}
