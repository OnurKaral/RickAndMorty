import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            theme: ThemeData(
          colorScheme: const ColorScheme.light(),
          useMaterial3: true,
        )));

  void toggleTheme() {
    final currentTheme = state.theme;
    final newTheme = currentTheme.colorScheme == const ColorScheme.light()
        ? ThemeData(colorScheme: const ColorScheme.dark(), useMaterial3: true)
        : ThemeData(colorScheme: const ColorScheme.light(), useMaterial3: true);

    emit(ThemeState(theme: newTheme));
  }
}
