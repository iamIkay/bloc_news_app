import 'package:equatable/equatable.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_state.dart';

class CategoryNewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/* class GetStories extends CategoryNewsEvent{

  @override 
  List<Object?> get props => [];
} */

class GetCategoryStory extends CategoryNewsEvent {
  GetCategoryStory({required this.categoryId});
  final String categoryId;

  @override
  List<Object?> get props => [categoryId];
}
