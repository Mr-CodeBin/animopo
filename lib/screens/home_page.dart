import 'package:animopo/models/article.dart';
import 'package:animopo/screens/detail_page.dart';
import 'package:animopo/screens/favorite_page.dart';
import 'package:animopo/screens/web_view_page.dart';
import 'package:animopo/services/article_service.dart';
import 'package:animopo/utils/constants.dart';
import 'package:animopo/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final articlesFuture = ArticleService.getArticles();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        scrolledUnderElevation: 0,
        title: const Text(Constants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteArticlesPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // app image
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Image.network(
              Constants.defaultNetworkImage,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Latest Articles',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: articlesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No articles found.'));
                } else {
                  final articles = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        final isWebView =
                            article.url != null && article.url!.isNotEmpty;
                        return ArticleCardWidget(
                          article: article,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => isWebView
                                    ? WebViewPage(
                                        url: article.url!,
                                      )
                                    : ArticleDetailPage(
                                        article: article,
                                      ),
                              ),
                            );
                          },
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
