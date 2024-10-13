import 'dart:developer';
import 'dart:ui';

import 'package:animopo/models/article.dart';
import 'package:animopo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ArticleCardWidget extends StatefulWidget {
  final Article article;
  final VoidCallback onTap;
  final String? author;

  const ArticleCardWidget({
    Key? key,
    required this.article,
    required this.onTap,
    this.author = 'AnimeMangaToon',
  }) : super(key: key);

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final box = Hive.box<Article>('favorites');
    isFavorite = box.containsKey(widget.article.title);
  }

  void toggleFavorite() {
    final box = Hive.box<Article>('favorites');
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        box.put(widget.article.title, widget.article);
      } else {
        box.delete(widget.article.title);
      }
    });

    log('Article saved to favorites into Hive storage ',
        name: 'ArticleCardWidget');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? 'Article saved to favorites.'
              : 'Article removed from favorites.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.article.urlImage ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: IconButton(
                              key: ValueKey<bool>(isFavorite),
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? Constants.textHighlightColor
                                    : Constants.hightlightColor,
                              ),
                              onPressed: toggleFavorite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured',
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.textHighlightColor,
                          ),
                        ),
                        Text(
                          widget.article.title,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 24,
                            letterSpacing: Constants.articleLetterSpacing,
                            height: Constants.articleLineHeight,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'By ${widget.author}',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.blue[800]
                                    : Colors.blue[200],
                          ),
                        ),
                        Divider(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.article.description,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.grey[300],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
