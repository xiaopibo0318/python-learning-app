// 📁 lib/screens/quiz/quiz_screen.dart

import 'package:flutter/material.dart';
import '../../models/question.dart';
import 'result_dialog.dart';
import '../../services/firestore_service.dart';
import '../../utils/logger.dart';

class QuizScreen extends StatefulWidget {
  final String chapterTitle;
  final String chapterID;
  final List<Question> questions;
  final VoidCallback onPassed;

  const QuizScreen({
    super.key,
    required this.chapterID,
    required this.chapterTitle,
    required this.questions,
    required this.onPassed,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

// 解鎖下一章節的邏輯
Future<void> _unlockNextChapter(BuildContext context, String chapterId) async {
  try {
    // 在 Firestore 中更新章節的狀態為已解鎖 # 下一章節
    await FirestoreService.unlockChapter(int.parse(chapterId) + 1);
  } catch (e) {
    AppLogger.chapter.severe('解鎖章節失敗: $e');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('❌ 解鎖章節失敗')));
  }
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool showAnswer = false;

  void checkAnswer(String selected) {
    if (showAnswer) return; // 防止連點
    final current = widget.questions[currentIndex];
    setState(() {
      selectedAnswer = selected;
      showAnswer = true;
      if (selected == current.answer) {
        score++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (currentIndex < widget.questions.length - 1) {
        setState(() {
          currentIndex++;
          selectedAnswer = null;
          showAnswer = false;
        });
      } else {
        final passed = score == widget.questions.length; // ✅ 必須全對
        if (passed) {
          widget.onPassed();
          _unlockNextChapter(context, widget.chapterID);
        }
        ;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (_) => ResultDialog(
                title: passed ? '🎉 恭喜全對通過！' : '未通過 😢',
                content: '你答對了 $score / ${widget.questions.length} 題',
                passed: passed,
                onRetry: () {
                  Navigator.pop(context);
                  setState(() {
                    currentIndex = 0;
                    score = 0;
                    selectedAnswer = null;
                    showAnswer = false;
                  });
                },
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final q = widget.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('${widget.chapterTitle} 測驗')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${currentIndex + 1}/${widget.questions.length}: ${q.question}',
              style: TextStyle(
                fontSize: screenWidth < 400 ? 18 : 20,
                fontFamily: 'GenSen',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '✅ 當前答對題數：$score / ${widget.questions.length}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            ...q.choices.map(
              (opt) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        showAnswer && selectedAnswer == opt
                            ? (opt == q.answer ? Colors.green : Colors.red)
                            : null,
                  ),
                  onPressed: () => checkAnswer(opt),
                  child: Text(opt),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
