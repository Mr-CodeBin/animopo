import 'package:animopo/models/article.dart';
import 'package:animopo/screens/web_view_page.dart';
import 'package:animopo/utils/constants.dart';
import 'package:animopo/widgets/spec_content_data_widget.dart';
import 'package:animopo/widgets/text_to_page_widget.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatefulWidget {
  final Article article;
  final bool? isWebview;
  const ArticleDetailPage({
    super.key,
    required this.article,
    this.isWebview = false,
  });

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, double> sectionOffsets = {
    'section1': 0,
    'section2': 400,
    'section3': 500,
  };

  // Function to scroll to a specific section
  void _scrollToSection(String sectionKey) {
    _scrollController.animateTo(
      sectionOffsets[sectionKey]!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Article Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              // widget.article.title,
              'Lore Olympus Webtoon: Jaw Dropping Seen on Media',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.article.publishedAt,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Text(
              'Dive into the intricate world of "Lore Olympus," where ancient myths collide with modern story, exploring power, love, trauma, and identity in captivating ways',
              style: TextStyle(
                fontSize: 12,
                color: Constants.hightlightColor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    // widget.article.urlImage,
                    'https://animemangatoon.com/wp-content/uploads/2024/05/lore--1140x570.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Content
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                // widget.article.description,
                'Lore Olympus is a romance webtoon created by Rachel Smythe. The story is a modern retelling of the relationship between the characters Hades and Persephone. The story is set in a modernized version of the Greek pantheon and other myths. The comic is updated every Sunday. The comic has been positively received for its art, story, and characters. It has been nominated for several awards, and has won a number of them.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // Sections
            const SpecificContentDataWidget(
              title: 'Hades',
              imageUrl:
                  'https://animemangatoon.com/wp-content/uploads/2024/05/64u47lg4-360x504.png.webp',
              description:
                  'In the Lore Olympus webtoon, Hades, the God of the underworld, takes center stage. Often depicted as a handsome blue man in a business suit, Hades runs the Underworld Corporation, serves as the older brother of Zeus and Poseidon, and plays a role in the Six Traitor Dynasty. His character takes on the burden of leadership and pursuing personal interests.',
            ),
            const SpecificContentDataWidget(
              title: 'Persephone',
              imageUrl:
                  'https://animemangatoon.com/wp-content/uploads/2024/05/myq53tdb-360x504.png.webp',
              description:
                  'Persephone, the goddess of spring, is the story’s heroine alongside the underworld. Initially portrayed as an innocent and naive young woman, her character develops dramatically as she faces more challenges.  Persephone is depicted with pink skin and a generous heart, a stark contrast to the harsh reality of Olympus. Her journey included discovering her strength, and she dealt with the trauma of being raped by Apollo, as well as her strong feelings about the underworld.',
            ),
            const SpecificContentDataWidget(
              title: 'Poseidon',
              imageUrl:
                  'https://animemangatoon.com/wp-content/uploads/2024/05/ccgqrffp-360x504.png.webp',
              description:
                  'Poseidon, the God of the sea, is Zeus’s brother from the underworld. He is usually characterized by a carefree and quick temperament, portrayed with green skin and long, wavy hair. Despite being slightly less witted, Poseidon is very loyal to his family. His relationship with his wife Amphitrite and their polygamous arrangement add an intriguing dynamic to his character.',
            ),
            TextToPageWidget(
              text: '[Read Lore Olympus Season 1 Review]',
              onTap: () {
                Navigator.push(
                  // Navigate to the next screen
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewPage(
                      url:
                          'https://animemangatoon.com/lore-olympus-season-1-review/',
                    ),
                  ),
                );
              },
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
