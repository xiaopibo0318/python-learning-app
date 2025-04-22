import 'package:flutter/material.dart';
import '../models/chapter.dart';
import '../screens/chapter/presentation_page.dart';
import '../data/content_registry.dart';

class ChapterContentTile extends StatelessWidget {
  final Content content;

  const ChapterContentTile({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 400 ? 16.0 : 18.0;
    final descSize = screenWidth < 400 ? 14.0 : 16.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          final slides = ContentRegistry.getSlides(content.topic);
          if (slides.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('⚠️ ${content.topic} 尚未設定內容')),
            );
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => PresentationPage(title: content.topic, slides: slides),
            ),
          );
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            title: Text(
              content.topic,
              style: TextStyle(
                fontFamily: 'GenSen',
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
              ),
            ),
            subtitle: Text(
              content.description,
              style: TextStyle(
                fontFamily: 'GenSen',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                fontSize: descSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
