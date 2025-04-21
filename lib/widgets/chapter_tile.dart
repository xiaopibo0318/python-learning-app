import 'package:flutter/material.dart';

class ChapterTitle extends StatelessWidget {
  final String title;
  final double? fontSize;
  final bool showIcon;

  const ChapterTitle({
    required this.title,
    this.fontSize,
    this.showIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final calculatedFontSize = fontSize ?? (screenWidth < 400 ? 20.0 : 24.0);

    return Row(
      children: [
        if (showIcon)
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.book, color: Colors.blue),
          ),
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'GenSen',
              fontWeight: FontWeight.bold,
              fontSize: calculatedFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
