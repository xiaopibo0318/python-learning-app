import 'package:flutter/material.dart';

/// 用來產生紅字、粗體、程式碼標記
String highlight(String keyword) => '<r>$keyword</r>';

/// 將 r b c 標記語法轉為 TextSpan 列表（支援巢狀）
List<InlineSpan> buildStyledText(String text) {
  final List<InlineSpan> spans = [];
  final RegExp tagPattern = RegExp(r'<(/?)(r|b|c)>');

  List<String> styleStack = [];
  int lastIndex = 0;

  Iterable<RegExpMatch> matches = tagPattern.allMatches(text);
  for (final match in matches) {
    final isClosing = match.group(1) == '/';
    final tag = match.group(2)!;
    final matchStart = match.start;
    final matchEnd = match.end;

    if (matchStart > lastIndex) {
      final segment = text.substring(lastIndex, matchStart);
      if (segment.isNotEmpty) {
        spans.add(
          TextSpan(text: segment, style: _resolveTextStyle(styleStack)),
        );
      }
    }

    if (isClosing) {
      if (styleStack.contains(tag)) {
        // Remove the last occurrence of this tag
        for (int i = styleStack.length - 1; i >= 0; i--) {
          if (styleStack[i] == tag) {
            styleStack.removeAt(i);
            break;
          }
        }
      }
    } else {
      styleStack.add(tag);
    }

    lastIndex = matchEnd;
  }

  // Add remaining text
  if (lastIndex < text.length) {
    spans.add(
      TextSpan(
        text: text.substring(lastIndex),
        style: _resolveTextStyle(styleStack),
      ),
    );
  }

  return spans;
}

/// 根據目前堆疊的標籤組合樣式
TextStyle _resolveTextStyle(List<String> tags) {
  Color? color;
  FontWeight? weight;
  String? fontFamily = 'GenSen';
  Color? background;

  for (final tag in tags) {
    switch (tag) {
      case 'r':
        color = Colors.red;
        weight = FontWeight.bold; // 紅色預設粗體
        break;
      case 'b':
        weight = FontWeight.bold;
        break;
      case 'c':
        fontFamily = 'monospace';
        background = const Color(0xFFF0F0F0);
        break;
    }
  }

  return TextStyle(
    color: color,
    fontWeight: weight ?? FontWeight.w500,
    fontFamily: fontFamily,
    backgroundColor: background,
    height: 1.5,
  );
}
