import 'package:news_app_bloc/repository/models/headline_news.dart';

import 'service/news_service.dart';

class NewsRepository {
  const NewsRepository({required this.service});

  final NewsService service;

  getEverything() => service.getAllNews();

  Future<HeadlineNews?> getStoryByCategory(String category) =>
      service.getCategoryNews(category);
}
