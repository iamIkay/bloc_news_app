import 'package:news_app_bloc/repository/models/headline_news.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_state.dart';

import 'service/news_service.dart';

class NewsRepository {
  const NewsRepository({required this.service});

  final NewsService service;

  getEverything() => service.getAllNews();

  Future<HeadlineNews?> getStoryByCategory(String category) =>
      service.getCategoryNews(category);

  
}
