import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/core/router/app_router.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/presentation/settings_screen/cubit/theme_cubit.dart';

Future<void> main() async {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: 'Rick And Morty',
          theme: state.theme,
        );
      }),
    );
  }
}
