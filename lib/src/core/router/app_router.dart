import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty_app/src/presentation/episodes_screen/views/episodes_screen.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/views/detail_page.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/views/main_screen.dart';
import 'package:rick_and_morty_app/src/presentation/principal_screen/views/principal_screen.dart';
import 'package:rick_and_morty_app/src/presentation/search_screen/views/search_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/principal',
          page: PrincipalRoute.page,
          children: [
            // `AudioPage` & `VideoPage` are nested children of `FeedPage`
            AutoRoute(path: 'main', page: MainRoute.page, children: [
              AutoRoute(page: CharacterDetailRoute.page),
            ]),
            AutoRoute(path: 'episode', page: EpisodeRoute.page),
            AutoRoute(path: 'search', page: SearchRoute.page),
          ],
        ),
      ];
}
