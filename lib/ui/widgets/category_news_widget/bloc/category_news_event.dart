import 'package:equatable/equatable.dart';

class CategoryNewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCategoryStory extends CategoryNewsEvent {
  GetCategoryStory({required this.categoryId});
  final String categoryId;

  @override
  List<Object?> get props => [categoryId];
}
