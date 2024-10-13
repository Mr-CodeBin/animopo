import 'package:animopo/models/article.dart';
import 'package:hive/hive.dart';

class StorageService {
  static List<Article> getFavoriteArticle() {
    final box = Hive.box<Article>('favorites');
    return box.values.toList();
  }
}
