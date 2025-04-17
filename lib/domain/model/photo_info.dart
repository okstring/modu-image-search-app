import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo.dart';

part 'photo_info.freezed.dart';

@freezed
class PhotoInfo with _$PhotoInfo {
  PhotoInfo({
    required this.hits,
  });

  final List<Photo> hits;
}