// 📁 lib/screens/chapter/chapter_screen.dart

import 'package:flutter/material.dart';
import 'package:apcs_app/models/chapter.dart';
import 'package:apcs_app/screens/chapter/chapter_content_page.dart';
import 'package:apcs_app/utils/logger.dart';

class ChapterScreen extends StatelessWidget {
  final List<Chapter> chapters;

  const ChapterScreen({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '章節選單',
          style: TextStyle(fontFamily: 'GenSen', fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: chapters.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return ListTile(
            title: Text(
              chapter.title,
              style: TextStyle(
                fontFamily: 'GenSen',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: chapter.isUnlocked ? Colors.black : Colors.grey,
              ),
            ),
            leading: Icon(
              chapter.isUnlocked ? Icons.lock_open : Icons.lock,
              color: chapter.isUnlocked ? Colors.green : Colors.grey,
            ),
            enabled: chapter.isUnlocked,
            onTap:
                chapter.isUnlocked
                    ? () {
                      AppLogger.chapter.info('🔓 開啟 ${chapter.title}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ChapterContentPage(
                                chapter: chapter,
                                onPassed: () {
                                  // TODO: 解鎖下一章節
                                  AppLogger.chapter.info(
                                    '🎉 完成章節 ${chapter.title}',
                                  );
                                },
                              ),
                        ),
                      );
                    }
                    : null,
          );
        },
      ),
    );
  }
}
