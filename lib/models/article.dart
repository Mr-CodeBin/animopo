import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)
class Article extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String? url;

  @HiveField(3)
  final String? urlImage;

  @HiveField(4)
  final String publishedAt;

  @HiveField(5)
  final double rating;

  @HiveField(6)
  final bool? isFavorite;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlImage,
    required this.publishedAt,
    this.rating = 0.0,
    this.isFavorite = false,
  });

  // factory Article.fromJson(Map<String, dynamic> json) {
  //   return Article(
  //       title: json['title'],
  //       description: json['description'],
  //       url: json['url'],
  //       urlToImage: json['urlToImage'],
  //       publishedAt: json['publishedAt'],
  //       rating: json['rating'] ?? 0.0,
  //       );
  // }
}
