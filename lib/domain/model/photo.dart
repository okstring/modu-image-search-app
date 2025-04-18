import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  Photo({
    required this.id,
    required this.tags,
    required this.previewURL,
    required this.user
  });

  final int id;
  final String tags;
  final String previewURL;
  final String user;
}