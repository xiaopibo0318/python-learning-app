import 'package:logging/logging.dart';

class AppLogger {
  static final Logger core = Logger('Core');
  static final Logger chapter = Logger('Chapter');
  static final Logger quiz = Logger('Quiz');
  static final Logger network = Logger('Network');
  static final Logger firestore = Logger('Firestore');

  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final logMsg =
          '[${record.level.name}] ${record.loggerName}: ${record.message}';
      print(logMsg); // 更通用，適用於所有平台
    });
  }
}

// ✅ 使用方式：
// 在 main.dart 裡呼叫 AppLogger.init();
// 然後使用：
//   AppLogger.core.info('應用啟動');
//   AppLogger.chapter.warning('章節載入失敗');
