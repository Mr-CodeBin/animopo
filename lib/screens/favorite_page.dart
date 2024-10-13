import 'package:animopo/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:animopo/models/article.dart';
import 'package:animopo/services/storage_service.dart';
import 'package:animopo/screens/web_view_page.dart';

class FavoriteArticlesPage extends StatefulWidget {
  const FavoriteArticlesPage({super.key});

  @override
  _FavoriteArticlesPageState createState() => _FavoriteArticlesPageState();
}

class _FavoriteArticlesPageState extends State<FavoriteArticlesPage> {
  List<Article>? favoriteArticles;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchFavoriteArticles();
  }

  Future<void> fetchFavoriteArticles() async {
    try {
      final articles = StorageService.getFavoriteArticle();
      setState(() {
        favoriteArticles = articles;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Favorite Articles'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text('Error: $errorMessage'))
              : favoriteArticles == null || favoriteArticles!.isEmpty
                  ? const Center(child: Text('No favorite articles found.'))
                  : ListView.builder(
                      itemCount: favoriteArticles!.length,
                      itemBuilder: (context, index) {
                        final article = favoriteArticles![index];
                        return ArticleCardWidget(
                          article: article,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WebViewPage(
                                  url: article.url!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
    );
  }
}
