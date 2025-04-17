import 'package:image_search_app/domain/model/photo.dart';

import '../dto/photo_dto.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(id: id, tags: tags, imageURL: imageURL);
  }
}
