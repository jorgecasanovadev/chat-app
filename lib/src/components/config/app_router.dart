import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  // @override
  // RouteType get defaultRouteType => const RouteType.custom();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, path: '/', initial: true),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        // AutoRoute(page: LoginView.page, path: '/login'),
        // AutoRoute(page: RegisterView.page, path: '/register'),
      ];
}
