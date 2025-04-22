import '../models/homework_slide.dart';
import 'ch1/homework.dart'; // 每章節的作業資料匯入

class HomeworkConfig {
  final List<HomeworkSlide> slides;
  final String submitUrl;

  HomeworkConfig({required this.slides, required this.submitUrl});
}

class HomeworkRegistry {
  static final Map<String, HomeworkConfig> registry = {
    '第 1 章：資料型態與輸入輸出': HomeworkConfig(
      slides: ch1HomeworkSlides,
      submitUrl: 'https://forms.gle/5Xq84gpyhCNkSFDD7',
    ),
    // 後續章節可依序加入
  };

  static HomeworkConfig? getHomework(String chapterTitle) {
    return registry[chapterTitle];
  }
}
