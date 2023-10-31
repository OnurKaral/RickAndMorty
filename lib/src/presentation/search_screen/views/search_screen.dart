import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/core/widgets/custom_bottom_sheet.dart';
import 'package:rick_and_morty_app/src/injector.dart';
import 'package:rick_and_morty_app/src/presentation/search_screen/cubit/search_characters_cubit.dart';

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

  void fetchData(String gender, String status) async {
    context.read<SearchCharactersCubit>().searchCharacters(gender, status);
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
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomBottomSheet(
                        onFilterChanged: (status, gender) {
                          fetchData(gender, status);
                        },
                      ),
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
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
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
          ],
        )));
  }
}
