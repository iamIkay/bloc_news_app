import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/repository/models/everything.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_event.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_state.dart';

import '../../../../repository/news_repository.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc({required this.newsRepository}) : super(AllNewsState()) {
    on<GetStories>(_mapGetStoriesEventToState);
  }
  final NewsRepository newsRepository;

  void _mapGetStoriesEventToState(
      GetStories event, Emitter<AllNewsState> emit) async {
    try {
      emit(state.copyWith(newStatus: AllNewsStatus.loading));
      final response = await newsRepository.getEverything() as Everything;

      emit(state.copyWith(stories: response, newStatus: AllNewsStatus.complete));
    } catch (e) {
      emit(state.copyWith(newStatus: AllNewsStatus.error));
    }
  }
}
