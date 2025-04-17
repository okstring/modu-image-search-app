import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo_info.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    @Default(null) PhotoInfo? photoInfo,
  }) = _HomeState;
}
