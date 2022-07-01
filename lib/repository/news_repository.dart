import 'package:news_app_bloc/repository/models/news_category.dart';
import 'package:news_app_bloc/repository/models/news_model.dart';

import 'service/news_service.dart';

class NewsRepository {
  const NewsRepository({required this.service});

  final NewsService service;

  getEverything() => service.getAllNews();

  Future<List<Story>> getStoryByCategory(NewsCategory category) =>
      service.getCategoryNews(category)!;

  
}
