import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
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
      body: const Center(),
    );
  }
}
