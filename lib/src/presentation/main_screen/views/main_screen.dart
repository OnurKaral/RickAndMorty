import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/bloc/get_characters/get_all_characters_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/widgets/character_card.dart';

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

@RoutePage()
class _MainScreen extends StatefulWidget {
  @override
  State<_MainScreen> createState() => __MainScreen();
}

class __MainScreen extends State<_MainScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  void fetchData() async {
    context.read<GetAllCharactersCubit>().getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty'), elevation: 10),
      body: Center(
        child: BlocBuilder<GetAllCharactersCubit, GetAllCharactersState>(
          builder: (context, state) {
            if (state is GetAllCharactersLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetAllCharactersSuccess) {
              return Column(
                children: [
                  /* Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        // Add a clear button to the search bar
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _searchController.clear(),
                        ),
                        // Add a search icon or button to the search bar
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        _searchController.text = value;
                      },
                    ),
                  ), */ // Search Bar
                  Expanded(
                      child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: state.response.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (index == state.response.data!.length - 2) {
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Character',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
