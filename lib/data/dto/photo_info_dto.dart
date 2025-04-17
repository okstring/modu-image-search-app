import 'package:json_annotation/json_annotation.dart';
import 'package:image_search_app/data/dto/photo_dto.dart';

part 'photo_info_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoInfoDto {
  List<PhotoDto> hits;

  PhotoInfoDto({required this.hits});

  factory PhotoInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoInfoDtoToJson(this);
}
