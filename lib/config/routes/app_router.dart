import 'package:event_planner/presentation/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_router_observer.dart';
import 'app_routes_name.dart';

class AppRouter {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final routers = GoRouter(
    observers: [
      GoRouterObserver(),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      return null;
    },
    debugLogDiagnostics: true,
    navigatorKey: parentNavigatorKey,
    initialLocation: '/home-screen',
    routes: [

      GoRoute(
        path: '/home-screen',
        name: AppRoutesName.homeScreen,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomeScreen(),
        ),
        // redirect: RedirectUtil.redirectForAuth,
      ),

    ],
  );
}
