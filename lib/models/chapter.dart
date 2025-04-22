import '../models/question.dart';
import 'homework_slide.dart';

class HomeworkConfig {
  final List<HomeworkSlide> slides;
  final String submitUrl;

  HomeworkConfig({required this.slides, required this.submitUrl});
}

class Chapter {
  String title;
  bool isUnlocked;
  List<Content> contents;
  List<Question> questions;
  HomeworkConfig? homeworkConfig; // ← 新增這個欄位，允許為 null

  Chapter({
    required this.title,
    this.isUnlocked = false,
    required this.contents,
    required this.questions,
    this.homeworkConfig,
  });
}

class Content {
  final String topic;
  final String description;

  Content({required this.topic, required this.description});
}
