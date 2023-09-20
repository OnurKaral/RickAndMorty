import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/presentation/bloc/get_characters/get_all_characters_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC')),
      body: Center(
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

                      return Card(
                        elevation: 4,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(characterImage),
                          ),
                          title: Text(
                            characterName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            'Status: $characterStatus',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Text(
                            'Species: $characterSpecies',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
