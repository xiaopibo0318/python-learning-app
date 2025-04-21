// 📁 lib/screens/quiz/result_dialog.dart

import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool passed;
  final VoidCallback onRetry;

  const ResultDialog({
    super.key,
    required this.title,
    required this.content,
    required this.passed,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (!passed) TextButton(onPressed: onRetry, child: const Text('重新挑戰')),
        TextButton(
          onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
          child: const Text('返回首頁'),
        ),
      ],
    );
  }
}
