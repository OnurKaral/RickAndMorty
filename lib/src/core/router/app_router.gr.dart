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
    EpisodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EpisodeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    PrincipalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrincipalScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
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
/// [EpisodeScreen]
class EpisodeRoute extends PageRouteInfo<void> {
  const EpisodeRoute({List<PageRouteInfo>? children})
      : super(
          EpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [PrincipalScreen]
class PrincipalRoute extends PageRouteInfo<void> {
  const PrincipalRoute({List<PageRouteInfo>? children})
      : super(
          PrincipalRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrincipalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
