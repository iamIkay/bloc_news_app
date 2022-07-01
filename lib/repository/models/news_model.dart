import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Story {
  String? title;
  String author;
  String description;
  String? urlToImage;
  DateTime publishedAt;
  String? content;
  String articleUrl;

  Story(
      {
        this.title,
      required this.description,
      required this.author,
      this.content,
      required this.publishedAt,
      this.urlToImage,
      required this.articleUrl});

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
