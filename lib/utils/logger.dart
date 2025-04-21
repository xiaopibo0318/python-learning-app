import 'dart:developer' as dev;
import 'package:logging/logging.dart';

class AppLogger {
  static final Logger core = Logger('CORE');
  static final Logger chapter = Logger('CHAPTER');
  static final Logger quiz = Logger('QUIZ');
  static final Logger network = Logger('NETWORK');

  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dev.log(
        '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
        name: record.loggerName,
      );
    });
  }
}

// ✅ 使用方式：
// 在 main.dart 裡呼叫 AppLogger.init();
// 然後使用：
//   AppLogger.core.info('應用啟動');
//   AppLogger.chapter.warning('章節載入失敗');
