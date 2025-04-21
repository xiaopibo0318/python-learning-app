import 'package:flutter/material.dart';
import '../../models/chapter.dart';
import '../quiz/quiz_screen.dart';
import '../chapter/presentation_page.dart';
import '../../data/content_registry.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 400 ? 16.0 : 18.0;
    final descSize = screenWidth < 400 ? 14.0 : 16.0;

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
        itemCount: chapter.contents.length + 1, // 最後一個是測驗按鈕
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index < chapter.contents.length) {
            final item = chapter.contents[index];
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  final slides = ContentRegistry.getSlides(item.topic);
                  if (slides.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('⚠️ ${item.topic} 尚未設定內容')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => PresentationPage(
                            title: item.topic,
                            slides: slides,
                          ),
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
                      item.topic,
                      style: TextStyle(
                        fontFamily: 'GenSen',
                        fontWeight: FontWeight.bold,
                        fontSize: titleSize,
                      ),
                    ),
                    subtitle: Text(
                      item.description,
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

          // 最後一個是按鈕
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => QuizScreen(
                            chapterTitle: chapter.title,
                            questions: chapter.questions,
                            onPassed: () {
                              onPassed(); // 通知外部解鎖下一章
                            },
                          ),
                    ),
                  );
                },
                child: const Text('開始測驗'),
              ),
            ),
          );
        },
      ),
    );
  }
}
