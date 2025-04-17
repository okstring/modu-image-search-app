import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  Photo({
    required this.id,
    required this.tags,
    required this.imageURL,
  });

  final int id;
  final String tags;
  final String imageURL;
}