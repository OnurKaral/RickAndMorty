import 'package:rick_and_morty_app/src/domain/entities/EpisodeEntity.dart';
import 'package:rick_and_morty_app/src/domain/entities/PlayerEntity.dart';

class EpisodesResponseEntity {
  EpisodesResponseEntity({this.data});

  List<EpisodeEntity>? data;
}
