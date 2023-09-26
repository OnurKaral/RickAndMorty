import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/router/app_router.dart';
import 'package:rick_and_morty_app/src/injector.dart';

Future<void> main() async {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Rick And Morty',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
    );
  }
}
