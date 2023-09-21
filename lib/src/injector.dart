import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/bloc/get_characters/get_all_characters_cubit.dart';

final injector = GetIt.instance;

Future<void> setup() async {
  injector
    ..registerLazySingleton(Dio.new)

    //Repository
    ..registerLazySingleton(ApiService.new)
    ..registerLazySingleton<CharactersRepository>(
        () => CharactersRepositoryImpl(apiService: injector()))
    //UseCases
    ..registerLazySingleton(() => GetAllCharactersUseCase(injector()))

    //Cubits
    ..registerFactory(() => GetAllCharactersCubit(injector()));
}
