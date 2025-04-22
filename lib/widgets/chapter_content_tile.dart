import 'package:flutter/material.dart';
import '../../models/chapter.dart'; // 假設 Content 模型

class ChapterContentTile extends StatelessWidget {
  final Content content;
  final VoidCallback onTap;

  const ChapterContentTile({
    super.key,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 400 ? 16.0 : 18.0;
    final descSize = screenWidth < 400 ? 14.0 : 16.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            title: Text(
              content.topic,
              style: TextStyle(
                fontFamily: 'GenSen',
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
              ),
            ),
            subtitle: Text(
              content.description,
              style: TextStyle(
                fontFamily: 'GenSen',
                fontStyle: FontStyle.italic,
                fontSize: descSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
