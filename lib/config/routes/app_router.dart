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
        // builder: (context, state)
        // {
        //   if(state.extra !=null)
        //   {
        //     Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        //
        //     return SetEventScreen(
        //       eventModelParam: extra["event"],
        //     );
        //   }
        //   else
        //   {
        //     return  SetEventScreen();
        //   }
        // },
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
              return  RouterTransitionFactory.getTransitionPage(
                context: context,
                state: state,
                child: const SetEventScreen(),
                type: Transition.scale, // fade|rotation|scale|size
              );
            }

        },
        // redirect: RedirectUtil.redirect,
      ),

    ],
  );
}


class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
        required GoRouterState state,
        required Widget child,
        required Transition type}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case Transition.fade:
              return FadeTransition(opacity: animation, child: child);
            case Transition.rotation:
              return RotationTransition(turns: animation, child: child);
            case Transition.size:
              return SizeTransition(sizeFactor: animation, child: child);
            case Transition.scale:
              return ScaleTransition(scale: animation, child: child);
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}

enum Transition
{
  fade ,
  rotation,
  size,
  scale
}