import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/di/di_setup.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/presentation/detail/detail_scene.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';
import 'package:image_search_app/presentation/home/home_scene.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return navigationShell;
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => HomeScreen(viewModel: getIt<HomeViewModel>()),
              ),
              GoRoute(
                path: Routes.detail,
                builder: (context, state) {
                  final photo = state.extra as Photo;
                  return DetailScreen(
                    viewModel: getIt<DetailViewModel>(param1: photo),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}