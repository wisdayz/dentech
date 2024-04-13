import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dentech/dto/news.dart';
import 'package:dentech/endpoints/endpoints.dart';

//melakukan operasi CRUD terhadap data berita dalam aplikasi
class DataService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoints.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  static Future<void> createNews(String title, String body) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints.news),
        body: jsonEncode(<String, String>{
          'title': title,
          'body': body,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create news');
      }
    } catch (error) {
      throw Exception('Failed to create news: $error');
    }
  }

  static Future<void> updateNews(String id, String title, String body) async {
    try {
      final response = await http.put(
        Uri.parse('${Endpoints.news}/$id'),
        body: jsonEncode(<String, String>{
          'title': title,
          'body': body,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update news');
      }
    } catch (error) {
      throw Exception('Failed to update news: $error');
    }
  }

  static Future<void> deleteNews(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${Endpoints.news}/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete news');
      }
    } catch (error) {
      throw Exception('Failed to delete news: $error');
    }
  }
}
