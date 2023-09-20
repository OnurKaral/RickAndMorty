import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/bloc/get_characters/get_all_characters_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/views/main_screen.dart';

Future<void> main() async {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => injector<GetAllCharactersCubit>(),
          child: const MainScreen()),
    );
  }
}
