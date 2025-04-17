import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto {
  int id;
  String tags;
  String imageURL;

  PhotoDto({
    required this.id,
    required this.tags,
    required this.imageURL,
  });
  
  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
