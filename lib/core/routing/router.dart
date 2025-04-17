import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/data/data_source/photo_data_source_impl.dart';
import 'package:image_search_app/data/repository/photo_repository_impl.dart';
import 'package:image_search_app/domain/use_case/photo_use_case.dart';
import 'package:image_search_app/presentation/home/home_scene.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder:
            (context, state) => HomeScreen(
          viewModel: HomeViewModel(
            photoUseCase: PhotoUseCase(
              photoRepository: PhotoRepositoryImpl(
                photoDataSource: PhotoDataSourceImpl(),
              ),
            ),
          ),
        ),
      ),

      GoRoute(
        path: Routes.detail,
        builder:
            (context, state) => HomeScreen(
              viewModel: HomeViewModel(
                photoUseCase: PhotoUseCase(
                  photoRepository: PhotoRepositoryImpl(
                    photoDataSource: PhotoDataSourceImpl(),
                  ),
                ),
              ),
            ),
      ),
    ],
  );
}
