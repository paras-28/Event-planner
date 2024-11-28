import 'package:event_planner/presentation/features/home/ui/home_screen.dart';
import 'package:event_planner/presentation/features/set_event/ui/set_event_screen.dart';
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
        // redirect: RedirectUtil.redirect,
      ),

      GoRoute(
        path: '/set-event',
        name: AppRoutesName.setEventScreen,
        pageBuilder: (context, state)
        {

          if(state.extra !=null)
            {
              Map<String, dynamic> extra = state.extra as Map<String, dynamic>;

              return NoTransitionPage(
                child: SetEventScreen(
                  eventModelParam: extra["event"],
                ),
              );
            }
          else
            {
              return const NoTransitionPage(
                child: SetEventScreen(),
              );
            }

        },
        // redirect: RedirectUtil.redirect,
      ),

    ],
  );
}
