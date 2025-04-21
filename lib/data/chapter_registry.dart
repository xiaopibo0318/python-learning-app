// 📁 lib/data/chapter_registry.dart

import 'package:apcs_app/models/chapter.dart';
import 'package:apcs_app/data/chapter_data_loader.dart';

class ChapterRegistry {
  static Future<List<Chapter>> loadAllChapters() async {
    final chapter1 = Chapter(
      title: '第 1 章：資料型態與輸入輸出',
      isUnlocked: true,
      contents: await ChapterDataLoader.loadContents('data/ch1/contents.json'),
      questions: await ChapterDataLoader.loadQuestions('data/ch1/quiz.json'),
    );

    final chapter2 = Chapter(
      title: '第 2 章：四則運算與邏輯判斷',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    final chapter3 = Chapter(
      title: '第 3 章：條件判斷',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    final chapter4 = Chapter(
      title: '第 4 章：迴圈',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    final chapter5 = Chapter(
      title: '第 5 章：進階資料型態',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    final chapter6 = Chapter(
      title: '第 6 章：資料處理',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    final chapter7 = Chapter(
      title: '第 7 章：進階數學計算',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    final chapter8 = Chapter(
      title: '第 8 章：陣列',
      isUnlocked: false,
      contents: const [],
      questions: const [],
    );

    // 👉 可繼續加 chapter2、chapter3...
    return [
      chapter1,
      chapter2,
      chapter3,
      chapter4,
      chapter5,
      chapter6,
      chapter7,
      chapter8,
    ];
  }
}
