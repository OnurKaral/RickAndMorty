import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/core/widgets/custom_bottom_sheet.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/settings_screen/cubit/search_characters_cubit.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<SearchCharactersCubit>(),
      child: _SearchScreen(),
    );
  }
}

class _SearchScreen extends StatefulWidget {
  @override
  State<_SearchScreen> createState() => __SearchScreen();
}

class __SearchScreen extends State<_SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  void fetchData() async {
    context.read<SearchCharactersCubit>().searchCharacters("alive", "male");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Open the custom bottom sheet when the filter icon is clicked
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SizedBox(
                      width: double.infinity, // Fill horizontally
                      child: CustomBottomSheet(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Center(
            child: Column(
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
                    onPressed: () {
                      fetchData();
                    },
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
            /*  Expanded(
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
                      )) */
          ],
        )));
  }
}
