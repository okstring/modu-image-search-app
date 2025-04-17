import 'package:image_search_app/data/dto/photo_info_dto.dart';

abstract interface class PhotoDataSource {
  Future<PhotoInfoDto> fetchPhoto(String query);
}
