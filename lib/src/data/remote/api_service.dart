import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rick_and_morty_app/src/core/utils/constants.dart';
import 'package:rick_and_morty_app/src/data/model/characters_response/characters_response.dart';

import '../../injector.dart';

class ApiService {
  final client = injector<Dio>();

  Future<CharactersResponse> getAllCharacters(int page) async {
    try {
      client.interceptors.add(PrettyDioLogger());

      final response = await client.get(
        "${Constants.baseUrl}/character?page=$page",
      );

      CharactersResponse allCharacters =
          CharactersResponse.fromJson(response.data);

      return allCharacters;
    } catch (e) {
      rethrow;
    }
  }
}
