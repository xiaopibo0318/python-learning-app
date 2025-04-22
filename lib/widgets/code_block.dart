import 'package:flutter/material.dart';

class CodeBlock extends StatelessWidget {
  final String title;
  final String content;
  final Color backgroundColor;

  const CodeBlock({
    super.key,
    required this.title,
    required this.content,
    this.backgroundColor = const Color(0xFFF5F5F5), // 淺灰色
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Courier', // 等寬字體
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
