import 'dart:convert';

import 'package:image_search_app/data/dto/photo_info_dto.dart';
import 'package:http/http.dart' as http;

import './photo_data_source.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<PhotoInfoDto> fetchPhoto(String query) async {
    const baseUrl = 'pixabay.com';
    final queryParameters = {
      'key': '10711147-dc41758b93b263957026bdadb',
      'q': query
    };
    final url = Uri.https(baseUrl, '/api', queryParameters);
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return PhotoInfoDto.fromJson(json);
  }
}
