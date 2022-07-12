import 'package:equatable/equatable.dart';
import '../../../../repository/models/headline_news.dart';

enum CategoryNewsStatus { initial, loading, success, error }

extension CategoryNewsX on CategoryNewsStatus {
  bool get isInitial => this == CategoryNewsStatus.initial;
  bool get isLoading => this == CategoryNewsStatus.loading;
  bool get isSucess => this == CategoryNewsStatus.success;
  bool get isError => this == CategoryNewsStatus.error;
}

class CategoryNewsState extends Equatable {
  const CategoryNewsState(
      {this.allStories,
      this.status = CategoryNewsStatus.initial,
      this.category = "general"});
  final CategoryNewsStatus status;
  final String? category;
  final HeadlineNews? allStories;

  @override
  List<Object?> get props => [status, allStories, category];

  CategoryNewsState copyWith(
      {CategoryNewsStatus? newStatus,
      HeadlineNews? stories,
      String? updateCategory}) {
    return CategoryNewsState(
        status: newStatus ?? status,
        allStories: stories ?? allStories,
        category: updateCategory ?? category);
  }
}
