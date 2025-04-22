// 📁 lib/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:apcs_app/models/chapter.dart';
import '../../services/firestore_service.dart';
import '../chapter/chapter_content_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Chapter>> _chaptersFuture;

  @override
  void initState() {
    super.initState();
    _chaptersFuture = FirestoreService.fetchChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Python 學習 App')),
      body: FutureBuilder<List<Chapter>>(
        future: _chaptersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('錯誤：${snapshot.error}'));
          }

          final chapters = snapshot.data ?? [];

          return ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];
              return ListTile(
                title: Text(chapter.title),
                leading: Icon(
                  chapter.isUnlocked ? Icons.lock_open : Icons.lock,
                  color: chapter.isUnlocked ? Colors.green : Colors.grey,
                ),
                onTap:
                    chapter.isUnlocked
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ChapterContentPage(
                                    chapter: chapter,
                                    onPassed: () {
                                      setState(() {
                                        chapter.isUnlocked = true;
                                      });
                                    },
                                  ),
                            ),
                          );
                        }
                        : null,
              );
            },
          );
        },
      ),
    );
  }
}
