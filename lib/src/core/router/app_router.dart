import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/views/detail_page.dart';
import 'package:rick_and_morty_app/src/presentation/main_screen/views/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: CharacterDetailRoute.page)
      ];
}
