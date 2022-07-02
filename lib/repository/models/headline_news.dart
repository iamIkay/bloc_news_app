import 'package:json_annotation/json_annotation.dart';
import 'news_model.dart';

part 'headline_news.g.dart';

@JsonSerializable(explicitToJson: true)
class HeadlineNews {
  String status;
  int totalResults;
  List<Story>? stories;
  Object? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? publishedAt;
  String? content;

  HeadlineNews(
      {required this.status,
      required this.totalResults,
      this.stories,
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.publishedAt,
      this.content});

  factory HeadlineNews.fromJson(Map<String, dynamic> json) =>
      _$HeadlineNewsFromJson(json);
}
