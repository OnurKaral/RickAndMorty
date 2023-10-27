import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/cubit/get_characters/get_all_characters_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/widgets/character_card.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<GetAllCharactersCubit>(),
      child: _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  @override
  State<_MainScreen> createState() => __MainScreen();
}

class __MainScreen extends State<_MainScreen> {
  void fetchData() async {
    context.read<GetAllCharactersCubit>().getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters'), elevation: 10),
      body: Center(
        child: BlocBuilder<GetAllCharactersCubit, GetAllCharactersState>(
          builder: (context, state) {
            if (state is GetAllCharactersLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetAllCharactersSuccess) {
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
                      final character = state.response.data?[index];

                      final characterName = character?.name ?? '';
                      final characterStatus = character?.status ?? '';
                      final characterSpecies = character?.species ?? '';
                      final characterImage = character?.image ?? '';

                      const aliveColor = Colors.green;
                      const deadColor = Colors.red;
                      Color statusColor =
                          characterStatus.toLowerCase() == 'dead'
                              ? deadColor
                              : aliveColor;

                      return CharacterCard(
                        characterName: characterName,
                        characterSpecies: characterSpecies,
                        characterStatus: characterStatus,
                        characterImage: characterImage,
                        statusColor: statusColor,
                      );
                    },
                  )),
                ],
              );
            } else if (state is GetAllCharactersFail) {
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
