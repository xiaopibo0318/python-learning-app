// 📁 lib/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:apcs_app/data/chapter_registry.dart';
import 'package:apcs_app/models/chapter.dart';
import 'package:apcs_app/screens/chapter/chapter_screen.dart';

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
    _chaptersFuture = ChapterRegistry.loadAllChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '從 0 開始學 Python',
          style: TextStyle(fontFamily: 'GenSen', fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Chapter>>(
        future: _chaptersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('❌ 載入失敗：${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('目前尚無章節'));
          }

          final chapters = snapshot.data!;
          return ChapterScreen(chapters: chapters);
        },
      ),
    );
  }
}
