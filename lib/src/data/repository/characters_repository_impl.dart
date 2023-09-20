import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/domain/entities/CharactersResponseEntity.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<CharactersResponseEntity> getAllCharacters() async {
    try {
      final response = await apiService.getAllCharacters();
      final entity = response.toEntity();
      return entity;
    } catch (e) {
      rethrow;
    }
  }
}
