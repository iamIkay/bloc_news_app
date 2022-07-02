import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Story {
  String? title;
  String? author;
  String? description;
  Map<String, dynamic>? source;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  String? articleUrl;

  Story(
      {this.title,
      required this.description,
      required this.author,
      this.content,
      this.source,
      required this.publishedAt,
      this.urlToImage,
      this.articleUrl});

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
