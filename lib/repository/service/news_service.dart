import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app_bloc/repository/models/everything.dart';
import 'package:news_app_bloc/repository/models/news_category.dart';
import 'package:news_app_bloc/repository/models/news_model.dart';

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
      //'category': 'sports',
      /*    'language': 'en',
      'q': 'apple',
      'from': '2022-06-29',
      'to': '2022-06-29', */
    };

    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$uri').replace(queryParameters: queryParameters);
  }

  Future<Everything?> getAllNews() async {
    final response = await _httpClient.get(getUri(uri: 'top-headlines'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      if (response.body.isNotEmpty) {
        return Everything.fromJson(jsonData);
      } else {
        log("Empty Response");
      }
    } else {
      log("Error getting News");
    }
    return null;
  }

  Future<List<Story>>? getCategoryNews(NewsCategory category) {
    return null;
  }
}
