// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CharacterDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterDetailScreen(
          characterName: args.characterName,
          characterSpecies: args.characterSpecies,
          characterStatus: args.characterStatus,
          characterImage: args.characterImage,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
  };
}

/// generated route for
/// [CharacterDetailScreen]
class CharacterDetailRoute extends PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    required String characterName,
    required String characterSpecies,
    required String characterStatus,
    required String characterImage,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterDetailRoute.name,
          args: CharacterDetailRouteArgs(
            characterName: characterName,
            characterSpecies: characterSpecies,
            characterStatus: characterStatus,
            characterImage: characterImage,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailRoute';

  static const PageInfo<CharacterDetailRouteArgs> page =
      PageInfo<CharacterDetailRouteArgs>(name);
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({
    required this.characterName,
    required this.characterSpecies,
    required this.characterStatus,
    required this.characterImage,
  });

  final String characterName;

  final String characterSpecies;

  final String characterStatus;

  final String characterImage;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{characterName: $characterName, characterSpecies: $characterSpecies, characterStatus: $characterStatus, characterImage: $characterImage}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
