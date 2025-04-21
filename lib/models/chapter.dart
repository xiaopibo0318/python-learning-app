import '../models/question.dart';

class Chapter {
  final String title;
  final bool isUnlocked;
  final List<Content> contents;
  final List<Question> questions;

  Chapter({
    required this.title,
    this.isUnlocked = false,
    required this.contents,
    required this.questions,
  });
}

class Content {
  final String topic;
  final String description;

  Content({required this.topic, required this.description});
}
