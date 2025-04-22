import 'package:flutter/material.dart';
import '../../models/chapter.dart';
import '../../widgets/chapter_content_tile.dart';
import '../../widgets/homework_tile.dart';
import '../../widgets/quiz_button.dart';
import '../chapter/presentation_page.dart';
import '../../services/firestore_service.dart';
import '../../utils/logger.dart';
import '../homework/homework_screen.dart';

class ChapterContentPage extends StatelessWidget {
  final Chapter chapter;
  final VoidCallback onPassed;

  const ChapterContentPage({
    super.key,
    required this.chapter,
    required this.onPassed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapter.title,
          style: const TextStyle(
            fontFamily: 'GenSen',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: chapter.contents.length + 2,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index < chapter.contents.length) {
            final contentItem = chapter.contents[index];
            return ChapterContentTile(
              content: contentItem,
              onTap: () async {
                AppLogger.chapter.info('讀取 topic：${contentItem.topic}');
                final slides = await FirestoreService.fetchSlides(
                  contentItem.topic,
                );

                if (slides.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('⚠️ ${contentItem.topic} 尚未有簡報內容')),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => PresentationPage(
                          title: contentItem.topic,
                          slides: slides,
                        ),
                  ),
                );
              },
            );
          }

          if (index == chapter.contents.length) {
            return HomeworkTile(
              title: chapter.title,
              onTap: () async {
                AppLogger.chapter.info('讀取 chapter ID:${chapter.id}');
                final slides = await FirestoreService.fetchHomeworks(
                  chapter.id,
                );
                final url = await FirestoreService.fetchSubmitUrl(chapter.id);

                if (slides.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('⚠️ 此章節尚未有作業內容')),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => HomeworkScreen(
                          chapterId: chapter.id,
                          submitUrl: url,
                        ),
                  ),
                );
              },
            );
          }

          return QuizButton(
            chapterTitle: chapter.title,
            questions: chapter.questions,
            onPassed: onPassed,
          );
        },
      ),
    );
  }
}
