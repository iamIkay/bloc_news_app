// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everything.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Everything _$EverythingFromJson(Map<String, dynamic> json) => Everything(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      stories: (json['articles'] as List<dynamic>?)
          ?.map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'],
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

