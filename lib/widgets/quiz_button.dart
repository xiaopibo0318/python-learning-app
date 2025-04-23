import 'package:flutter/material.dart';
import '../models/question.dart';
import '../screens/quiz/quiz_screen.dart';

class QuizButton extends StatelessWidget {
  final String chapterTitle;
  final String chapterID;
  final List<Question> questions;
  final VoidCallback onPassed;

  const QuizButton({
    super.key,
    required this.chapterTitle,
    required this.chapterID,
    required this.questions,
    required this.onPassed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => QuizScreen(
                    chapterTitle: chapterTitle,
                    chapterID: chapterID,
                    questions: questions,
                    onPassed: onPassed,
                  ),
            ),
          );
        },
        child: const Text('開始測驗'),
      ),
    );
  }
}
