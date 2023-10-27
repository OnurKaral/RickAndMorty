import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/episodes_screen/cubit/get_episodes/get_all_episodes_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/episodes_screen/widgets/episode_card.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/cubit/get_characters/get_all_characters_cubit.dart';

@RoutePage()
class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<GetAllEpisodesCubit>(),
      child: _EpisodeScreen(),
    );
  }
}

class _EpisodeScreen extends StatefulWidget {
  @override
  State<_EpisodeScreen> createState() => __EpisodeScreen();
}

class __EpisodeScreen extends State<_EpisodeScreen> {
  void fetchData() async {
    context.read<GetAllEpisodesCubit>().getAllEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes'), elevation: 10),
      body: Center(
        child: BlocBuilder<GetAllEpisodesCubit, GetAllEpisodesState>(
          builder: (context, state) {
            if (state is GetAllEpisodesLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetAllEpisodesSuccess) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: state.response.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (index == state.response.data!.length - 4) {
                        fetchData();
                      }

                      final episode = state.response.data?[index];
                      final episodeName = episode?.name ?? '';
                      final episodeAirDate = episode?.airDate ?? '';
                      final episodeLayer = episode?.episode ?? '';

                      return EpisodeCard(
                        episodeName: episodeName,
                        episodeAirDate: episodeAirDate,
                        episode: episodeLayer,
                      );
                    },
                  )),
                ],
              );
            } else if (state is GetAllEpisodesFail) {
              return Text(state.message);
            } else if (state is GetAllCharactersInitial) {
              return const CircularProgressIndicator();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
