// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      title: json['title'] as String?,
      description: json['description'] as String,
      author: json['author'] as String,
      content: json['content'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      urlToImage: json['urlToImage'] as String?,
      articleUrl: json['url'] as String,
    );
