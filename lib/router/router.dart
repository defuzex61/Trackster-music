import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:trackster_music/router/router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(
      page: HomeRoute.page,
      path: "/"
    ),
    AutoRoute(
        page: SearchRoute.page,
        path: "/search"
    ),
    AutoRoute(
        page: LibraryRoute.page,
        path: "/library"
    ),
  ];
}