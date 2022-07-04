import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/repository/models/headline_news.dart';

import '../../../../repository/news_repository.dart';
import 'category_news_event.dart';
import 'category_news_state.dart';

class CategoryNewsBloc extends Bloc<CategoryNewsEvent, CategoryNewsState> {
  CategoryNewsBloc({required this.newsRepository})
      : super(const CategoryNewsState()) {
    on<GetCategoryStory>(_mapGetStoriesEventToState);
  }
  final NewsRepository newsRepository;

  void _mapGetStoriesEventToState(
      GetCategoryStory event, Emitter<CategoryNewsState> emit) async {
    try {
      emit(state.copyWith(
          newStatus: CategoryNewsStatus.loading,
          updateCategory: event.categoryId));

      final response = await newsRepository.getStoryByCategory(event.categoryId)
          as HeadlineNews;

      emit(state.copyWith(
          stories: response,
          newStatus: CategoryNewsStatus.complete,
          updateCategory: event.categoryId));
    } catch (e) {
      emit(state.copyWith(newStatus: CategoryNewsStatus.error));
    }
  }
}
