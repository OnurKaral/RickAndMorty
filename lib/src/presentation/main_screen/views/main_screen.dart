import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/bloc/get_characters/get_all_characters_cubit.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/widgets/character_card.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _currentIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty')),
      body: BlocProvider(
          create: (context) => injector<GetAllCharactersCubit>(),
          child: Center(
            child: BlocBuilder<GetAllCharactersCubit, GetAllCharactersState>(
              builder: (context, state) {
                if (state is GetAllCharactersLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GetAllCharactersSuccess) {
                  return Column(
                    children: [
                      Padding(
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
                      ),
                      Expanded(
                          child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemCount: state.response.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final character = state.response.data?[index];

                          final characterName = character?.name ?? '';
                          final characterStatus = character?.status ?? '';
                          final characterSpecies = character?.species ?? '';
                          final characterImage = character?.image ?? '';

                          // Define status colors as constants
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
                  return const Text('Lütfen Butona Basınız.');
                }
                return const SizedBox.shrink();
              },
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        // Remove default bottom navigation bar shadow
        backgroundColor: Colors.white,
        // Background color of the bottom navigation bar
        selectedItemColor: Colors.blue,
        // Color for the selected item's icon and label
        unselectedItemColor: Colors.grey,
        // Color for unselected items
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore), // Icon for the "Explore" item
            label: 'Explore', // Label for the "Explore" item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
