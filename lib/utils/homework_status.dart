import 'package:shared_preferences/shared_preferences.dart';

class HomeworkStatus {
  static Future<void> markAsSubmitted(String chapterTitle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hw_${chapterTitle}_submitted', true);
  }

  static Future<bool> isSubmitted(String chapterTitle) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hw_${chapterTitle}_submitted') ?? false;
  }
}
