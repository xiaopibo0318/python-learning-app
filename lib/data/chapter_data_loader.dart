// 📁 lib/data/chapter_data_loader.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/chapter.dart';
import '../models/question.dart';
import '../utils/logger.dart';

class ChapterDataLoader {
  static Future<List<Content>> loadContents(String assetPath) async {
    AppLogger.chapter.info('📥 載入內容 JSON：$assetPath');
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final dynamic parsed = jsonDecode(jsonString);

      if (parsed is! List) {
        AppLogger.chapter.severe(
          '❌ 格式錯誤：內容 JSON 應為 List，但實際為 ${parsed.runtimeType}',
        );
        throw Exception('內容 JSON 應為 List');
      }

      AppLogger.chapter.info('✅ 成功載入 ${parsed.length} 筆內容');
      return parsed
          .map(
            (e) => Content(
              topic: e['topic'] ?? '（未命名）',
              description: e['description'] ?? '',
            ),
          )
          .toList();
    } catch (e) {
      AppLogger.chapter.severe('❌ 載入內容失敗：$e');
      rethrow;
    }
  }

  static Future<List<Question>> loadQuestions(String assetPath) async {
    AppLogger.chapter.info('📥 載入測驗 JSON：$assetPath');
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final dynamic parsed = jsonDecode(jsonString);

      if (parsed is! List) {
        AppLogger.chapter.severe(
          '❌ 格式錯誤：測驗 JSON 應為 List，但實際為 ${parsed.runtimeType}',
        );
        throw Exception('測驗 JSON 應為 List');
      }

      AppLogger.chapter.info('✅ 成功載入 ${parsed.length} 題測驗');
      return parsed
          .map(
            (e) => Question(
              question: e['question'],
              choices: List<String>.from(e['choices']),
              answer: e['answer'],
            ),
          )
          .toList();
    } catch (e) {
      AppLogger.chapter.severe('❌ 載入測驗失敗：$e');
      rethrow;
    }
  }
}
