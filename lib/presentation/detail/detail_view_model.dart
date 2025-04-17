import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/detail/detail_state.dart';

class DetailViewModel extends ChangeNotifier {
  final DetailState _state = DetailState();
  DetailState get state => _state;
}