// 📁 lib/data/content_registry.dart

import 'package:apcs_app/data/chapter_data_loader.dart';
import 'package:apcs_app/models/slide_content.dart';
import 'package:apcs_app/models/question.dart';
import 'ch1/slides.dart' as ch1Slides;

class ContentRegistry {
  // slide 對應（靜態）
  static final Map<String, List<SlideContent>> slides = {
    '變數': ch1Slides.variableSlides,
    '資料型態 I': ch1Slides.datatypeSlides,
    // 可以繼續加其他章節小主題
  };

  // quiz 對應（動態載入）
  static final Map<String, Future<List<Question>>> quizFutures = {
    '第 1 章：資料型態與輸入輸出': ChapterDataLoader.loadQuestions('data/ch1/quiz.json'),
  };

  static Future<List<Question>> getQuiz(String chapterTitle) async {
    return await quizFutures[chapterTitle] ?? Future.value([]);
  }

  static List<SlideContent> getSlides(String topic) {
    return slides[topic] ?? [];
  }
}
