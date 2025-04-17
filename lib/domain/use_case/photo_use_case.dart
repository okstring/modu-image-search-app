import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo_info.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

class PhotoUseCase {
  final PhotoRepository _photoRepository;

  const PhotoUseCase({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  Future<Result<PhotoInfo, Exception>> getPhotoInfo(String query) async {
    try {
      final photoInfo = await _photoRepository.getPhotoInfo(query);
      return Result.success(photoInfo);
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception('알 수 없는 오류: $e'));
    }
  }
}