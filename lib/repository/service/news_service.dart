import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app_bloc/repository/models/headline_news.dart';

class NewsService {
  NewsService(
      {this.baseUrl = "https://newsapi.org/v2", http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final Client _httpClient;
  final String? baseUrl;

  Uri getUri({required String uri, Map<String, String>? extraParameters}) {
    final queryParameters = <String, dynamic>{
      'apiKey': dotenv.get('NEWS_API_KEY'),
      'country': 'us',
    };

    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$uri').replace(queryParameters: queryParameters);
  }

  Future<HeadlineNews?> getAllNews() async {
    final response = await _httpClient.get(getUri(uri: 'top-headlines'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      if (response.body.isNotEmpty) {
        return HeadlineNews.fromJson(jsonData);
      } else {
        log("Empty Response");
      }
    } else {
      log("Error getting News");
    }
    return null;
  }

  Future<HeadlineNews?> getCategoryNews(String category) async {
    final response = await _httpClient.get(
        getUri(uri: 'top-headlines', extraParameters: {'category': category}));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      if (response.body.isNotEmpty) {
        return HeadlineNews.fromJson(jsonData);
      } else {
        log("Empty response!");
      }
    } else {
      log("Error fetching data!");
    }

    return null;
  }
}
