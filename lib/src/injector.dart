import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/src/core/router/app_router.dart';
import 'package:rick_and_morty_app/src/data/remote/api_service.dart';
import 'package:rick_and_morty_app/src/data/repository/characters_repository_impl.dart';
import 'package:rick_and_morty_app/src/data/repository/episodes_repository_impl.dart';
import 'package:rick_and_morty_app/src/data/repository/search_repository_impl.dart';
import 'package:rick_and_morty_app/src/domain/repository/characters_repository.dart';
import 'package:rick_and_morty_app/src/domain/repository/episodes_repository.dart';
import 'package:rick_and_morty_app/src/domain/repository/search_characters_repository.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_episodes_usecase.dart';
import 'package:rick_and_morty_app/src/domain/usecases/get_search_characters_usecase.dart';
import 'package:rick_and_morty_app/src/presentation/episodes_screen/cubit/get_episodes/get_all_episodes_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/cubit/get_characters/get_all_characters_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/settings_screen/cubit/search_characters_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/settings_screen/cubit/theme/theme_cubit.dart';

final injector = GetIt.instance;

Future<void> setup() async {
  injector
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton<AppRouter>(AppRouter.new)

    //Repository
    ..registerLazySingleton(ApiService.new)
    ..registerLazySingleton<CharactersRepository>(
        () => CharactersRepositoryImpl(apiService: injector()))
    ..registerLazySingleton<EpisodesRepository>(
        () => EpisodesRepositoryImpl(apiService: injector()))
    ..registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(apiService: injector()))
    //UseCases
    ..registerLazySingleton(() => GetSearchCharactersUseCase(injector()))
    ..registerLazySingleton(() => GetAllCharactersUseCase(injector()))
    ..registerLazySingleton(() => GetAllEpisodesUseCase(injector()))

    //Cubits
    ..registerFactory(() => ThemeCubit())
    ..registerFactory(() => SearchCharactersCubit(injector()))
    ..registerFactory(() => GetAllCharactersCubit(injector()))
    ..registerFactory(() => GetAllEpisodesCubit(injector()));
}
