import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/newsArticle.dart';
import '../utils/constants.dart';

class WebServices {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    String url =
        '${Constants.BASE_URL}/everything?q=$keyword&apiKey=${Constants.API_KEY}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw new Exception('Failed to get news');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        '${Constants.BASE_URL}/top-headlines?country=us&apiKey=${Constants.API_KEY}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw new Exception('Failed to get news');
    }
  }
}
