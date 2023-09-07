import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> setup() async {
  injector.registerLazySingleton(Dio.new);

  //Repository

  //UseCases

  //Cubits
}
