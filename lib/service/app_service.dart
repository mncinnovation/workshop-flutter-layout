import 'package:dio/dio.dart';
import 'package:flutter_layout_app/model/artikel_model.dart';
// import 'package:http/http.dart' as http;

class AppService {
  Future<ArtikelModel> fetchArticle() async {
    Dio dio = Dio();

    var header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await dio.get(
        'https://private-1518a-celebrities.apiary-mock.com/celeb',
        options: Options(headers: header));

    if (response.statusCode == 200) {
      final result = ArtikelModel.fromMap(response.data);
      return result;
    } else {
      throw Exception('Failed to load artikel');
    }
  }
}
