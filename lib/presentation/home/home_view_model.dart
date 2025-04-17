import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo_info.dart';
import 'package:image_search_app/domain/use_case/photo_use_case.dart';
import 'package:image_search_app/presentation/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final PhotoUseCase _photoUseCase;

  HomeState _state = HomeState();

  HomeState get state => _state;

  HomeViewModel({required PhotoUseCase photoUseCase})
    : _photoUseCase = photoUseCase;

  void getPhotoInfo(String query) async {
    final result = await _photoUseCase.getPhotoInfo(query);

    switch (result) {
      case Success<PhotoInfo, Exception>():
        print(result.data);
        _state = _state.copyWith(photoInfo: result.data);
        notifyListeners();
        break;
      case Error<PhotoInfo, Exception>():
        print('error가 발생했습니다. ${result.error.toString()}');
        break;
    }
  }
}
