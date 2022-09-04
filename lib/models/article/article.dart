import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {

  factory Article({
    Source? source,
    @Default("") String author,
    @Default("") String title,
    @Default("") String description,
    @Default("") String url,
    @Default("") String urlToImage,
    DateTime? publishedAt,
    @Default("") String content,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json)
  => _$ArticleFromJson(json);

}

@freezed
class Source with _$Source {

  factory Source({
    @Default("") String id,
    @Default("") String name,
  }) = _Source;

  factory Source.fromJson(Map<String, Object?> json)
  => _$SourceFromJson(json);
}