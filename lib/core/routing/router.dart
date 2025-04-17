import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/data/data_source/photo_data_source_impl.dart';
import 'package:image_search_app/data/repository/photo_repository_impl.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/use_case/photo_use_case.dart';
import 'package:image_search_app/presentation/detail/detail_scene.dart';
import 'package:image_search_app/presentation/detail/detail_state.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';
import 'package:image_search_app/presentation/home/home_scene.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  // DI 필요
  static final homeViewModel = HomeViewModel(
    photoUseCase: PhotoUseCase(
      photoRepository: PhotoRepositoryImpl(
        photoDataSource: PhotoDataSourceImpl(),
      ),
    ),
  );

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder:
            (context, state) => HomeScreen(
              viewModel: homeViewModel,
            ),
      ),

      GoRoute(
        path: Routes.detail,
        builder: (context, state) {
          final photo = state.extra as Photo;
          final detailState = DetailState(photo: photo);

          return DetailScreen(viewModel: DetailViewModel(state: detailState));
        },
      ),
    ],
  );
}
