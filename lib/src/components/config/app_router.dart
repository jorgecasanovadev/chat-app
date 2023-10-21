import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  // @override
  // RouteType get defaultRouteType => const RouteType.custom();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
      ];
}
