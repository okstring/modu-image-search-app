import 'package:image_search_app/data/dto/photo_info_dto.dart';
import 'package:image_search_app/data/mapper/photo_mapper.dart';
import 'package:image_search_app/domain/model/photo_info.dart';

import '../dto/photo_dto.dart';

extension PhotoInfoMapper on PhotoInfoDto {
  PhotoInfo toPhotoInfo() {
    return PhotoInfo(hits: hits.map((e) => e.toPhoto()).toList());
  }
}
