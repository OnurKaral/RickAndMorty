import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/cubit/get_characters/get_all_characters_cubit.dart';

@RoutePage()
class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<GetAllCharactersCubit>(),
      child: _EpisodeScreen(),
    );
  }
}

class _EpisodeScreen extends StatefulWidget {
  @override
  State<_EpisodeScreen> createState() => __EpisodeScreen();
}

class __EpisodeScreen extends State<_EpisodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty'), elevation: 10),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(children: <Widget>[
              const SizedBox(height: 30),
              const Text('Filled'),
              const SizedBox(height: 15),
              FilledButton(
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              const SizedBox(height: 30),
              const FilledButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ]),
            const SizedBox(width: 30),
            Column(children: <Widget>[
              const SizedBox(height: 30),
              const Text('Filled tonal'),
              const SizedBox(height: 15),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              const SizedBox(height: 30),
              const FilledButton.tonal(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
