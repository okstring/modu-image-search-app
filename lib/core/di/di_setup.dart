import 'package:get_it/get_it.dart';
import 'package:image_search_app/data/data_source/photo_data_source.dart';
import 'package:image_search_app/data/data_source/photo_data_source_impl.dart';
import 'package:image_search_app/data/repository/photo_repository_impl.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/use_case/photo_use_case.dart';
import 'package:image_search_app/presentation/detail/detail_state.dart';
import 'package:image_search_app/presentation/detail/detail_view_model.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoDataSource>(PhotoDataSourceImpl());

  getIt.registerSingleton<PhotoRepository>(
    PhotoRepositoryImpl(photoDataSource: getIt()),
  );

  getIt.registerSingleton<PhotoUseCase>(PhotoUseCase(photoRepository: getIt()));

  getIt.registerCachedFactory<HomeViewModel>(
    () => HomeViewModel(photoUseCase: getIt()),
  );

  getIt.registerCachedFactoryParam<DetailViewModel, Photo, void>(
    (photo, _) => DetailViewModel(state: DetailState(photo: photo)),
  );
}
