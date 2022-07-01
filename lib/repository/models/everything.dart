import 'package:json_annotation/json_annotation.dart';
import 'news_model.dart';

part 'everything.g.dart';

@JsonSerializable(explicitToJson: true)
class Everything {
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

  Everything(
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

  factory Everything.fromJson(Map<String, dynamic> json) =>
      _$EverythingFromJson(json);
}
