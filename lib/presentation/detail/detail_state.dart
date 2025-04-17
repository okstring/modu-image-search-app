import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
  }) = _DetailState;
}
