import 'dart:convert';

import 'package:flutter_layout_app/model/artikel_model.dart';
import 'package:http/http.dart' as http;

class AppService {
  Future<ArtikelModel> fetchArticle() async {
    var header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.get(
        Uri.parse('https://private-1518a-celebrities.apiary-mock.com/celeb'),
        headers: header);

    if (response.statusCode == 200) {
      final result = ArtikelModel.fromMap(jsonDecode(response.body));
      return result;
    } else {
      throw Exception('Failed to load artikel');
    }
  }
}
