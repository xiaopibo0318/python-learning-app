import 'package:flutter/material.dart';
import '../../models/chapter.dart';
import '../../widgets/chapter_content_tile.dart';
import '../../widgets/homework_tile.dart';
import '../../widgets/quiz_button.dart';

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
      appBar: AppBar(title: Text(chapter.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...chapter.contents.map((c) => ChapterContentTile(content: c)),
          const SizedBox(height: 20),
          HomeworkTile(chapterTitle: chapter.title),
          const SizedBox(height: 30),
          QuizButton(
            chapterTitle: chapter.title,
            questions: chapter.questions,
            onPassed: onPassed,
          ),
        ],
      ),
    );
  }
}
