import 'package:flutter/material.dart';
import 'utils/logger.dart';
import 'screens/home/home_screen.dart'; // ✅ 匯入新 Home 畫面

void main() {
  AppLogger.init();
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
