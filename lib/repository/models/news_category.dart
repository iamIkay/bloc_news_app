import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class NewsCategory {
  String? name;
  String? image;

  NewsCategory({this.name, this.image});
}
