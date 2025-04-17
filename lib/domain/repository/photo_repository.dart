import 'package:image_search_app/domain/model/photo_info.dart';

abstract interface class PhotoRepository {
  Future<PhotoInfo> getPhotoInfo(String query);
}
