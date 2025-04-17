import 'package:image_search_app/data/mapper/photo_info_mapper.dart';
import 'package:image_search_app/domain/model/photo_info.dart';

import '../../domain/repository/photo_repository.dart';
import '../data_source/photo_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  const PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<PhotoInfo> getPhotoInfo(String query) async {
    final photoInfoDto = await _photoDataSource.fetchPhoto(query);
    final photoInfo = photoInfoDto.toPhotoInfo();
    return photoInfo;
  }
}
