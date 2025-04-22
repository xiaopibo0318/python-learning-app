import 'package:flutter/material.dart';
import 'utils/logger.dart';
import 'screens/home/home_screen.dart'; // ✅ 匯入新 Home 畫面
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase CLI 會產生這個檔案

void main() async {
  AppLogger.init();
  AppLogger.chapter.info('🚀 Logger 測試成功！');
  WidgetsFlutterBinding.ensureInitialized(); // 初始化綁定
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const APCSApp());
}

class APCSApp extends StatelessWidget {
  const APCSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python 學習 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'GenSen', // ✅ 預設全局字體
      ),
      home: const HomeScreen(), // ✅ 改這裡
    );
  }
}
