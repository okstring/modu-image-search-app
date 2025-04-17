import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    required Photo photo
  }) = _DetailState;
}
