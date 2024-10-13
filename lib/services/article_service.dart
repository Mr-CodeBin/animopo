import 'package:animopo/models/article.dart';

class ArticleService {
  static Future<List<Article>> getArticles() async {
    await Future.delayed(Duration(seconds: 1));
    // Fetch articles from the internet

    return [
      Article(
        title: 'Lore Olympus Webtoon: Jaw Dropping Seen on Media',
        description:
            'Do you believe in supernatural creatures like werewolves, vampires, and witches? How would you feel if one day you were transported to a different realm when you touched a painting? The same thing happened with Serena in The Alpha King’s Claim. One rainy day, she buys an interesting painting while taking shelter in a painting shop. When she touched the painting at her home, she got transported to the realm where werewolves lived. Moreover, she ends up on the bed of the Alpha King Aero, who hates all women.',
        url: 'https://animemangatoon.com/lore-olympus-webtoon-overview/',
        urlImage:
            'https://animemangatoon.com/wp-content/uploads/2024/05/lore--1140x570.png',
        publishedAt: '2021-10-01',
        rating: 4.5,
      ),
      Article(
        title: 'I Love Yoo Chapter 17-24: Shin-Ae and Yeong-Gi',
        description:
            'I Love Yoo Chapter 17-24 deals with Shin-ae and her feelings for Kousuke and Yeong-gi and how they help her feel better about herself and life',
        url: 'https://animemangatoon.com/i-love-yoo-shin-ae-and-yeong-gi/',
        urlImage:
            'https://animemangatoon.com/wp-content/uploads/2024/10/MixCollage-04-Oct-2024-12-29-AM-5560-350x250.webp',
        publishedAt: '2021-10-02',
        rating: 4.0,
      ),
      Article(
        title: 'Refund High School Chapter 115-122: Reincarnation Exam',
        description:
            'Refund High School Chapter 115-122 focuses on the difficulties Aru and her friends face during the reincarnation exam',
        url:
            'https://animemangatoon.com/refund-high-school-reincarnation-exam/',
        urlImage:
            'https://animemangatoon.com/wp-content/uploads/2024/10/Screenshot-2024-10-07-110308-350x250.webp',
        publishedAt: '2021-10-03',
        rating: 3.5,
      ),
      Article(
        title: 'I Love Yoo Chapter 9-16: Shin-a e and Yeong-Gi’s Path',
        description:
            'I Love Yoo Chapter 9-16 deals with Shin-ae meeting Yeong-gi and feeling conflicted about her usual nature and being vulnerable by opening up.',
        url:
            'https://animemangatoon.com/i-love-yoo-shin-ae-and-yeong-gis-path/',
        urlImage:
            'https://animemangatoon.com/wp-content/uploads/2024/09/MixCollage-29-Sep-2024-12-18-AM-7906-350x250.webp',
        publishedAt: '2021-10-04',
        rating: 3.0,
      ),
      Article(
        title: 'Operation True Love Chapter 0-8: Who Is Su-ae Shim?',
        description:
            'Operation True Love Chapter 0-8 introduces the readers to Su-ae Shim’s world, while dealing with love and betrayal.',
        url:
            'https://animemangatoon.com/operation-true-love-who-is-su-ae-shim/',
        urlImage:
            'https://animemangatoon.com/wp-content/uploads/2024/10/MixCollage-01-Oct-2024-08-03-PM-2911-350x250.webp',
        publishedAt: '2021-10-05',
        rating: 2.5,
      ),
    ];
  }
}
