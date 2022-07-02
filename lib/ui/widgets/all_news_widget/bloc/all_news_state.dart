import 'package:equatable/equatable.dart';
import '../../../../repository/models/headline_news.dart';

enum CategoryNewsStatus { initial, loading,complete, error }

extension CategoryNewsX on CategoryNewsStatus {
  bool get isInitial => this == CategoryNewsStatus.initial;
  bool get isLoading => this == CategoryNewsStatus.loading;
  bool get isComplete => this == CategoryNewsStatus.complete;
  bool get isError => this == CategoryNewsStatus.error;
}

/* enum CategoryNews { general, business, selected, entertainment, health, science }

extension CategoryX on CategoryNews {
  bool get isGeneral => this == CategoryNews.general;
  bool get isBusiness => this == CategoryNews.business;
  bool get isEntertainment => this == CategoryNews.entertainment;
  bool get isHealth => this == CategoryNews.health;
  bool get isScience => this == CategoryNews.science;
  bool get isSelected => this == CategoryNews.selected;
} */

class CategoryNewsState extends Equatable {
  const CategoryNewsState(
      {this.allStories,
      this.status = CategoryNewsStatus.initial,
      this.category = "general"});
  final CategoryNewsStatus? status;
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
