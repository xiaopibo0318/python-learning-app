# apcs_app

A new Flutter project.


# 當前資料夾架構如下

assets/
├── data/       # 存放章節裡面的內容以及問題的json檔案。
│   ├── ch1/
│   │   ├── contents.json
│   │   └── quiz.json
│   └── ch2/
├── fonts/      # 存放字體
│   └── GenSenRounded2-M.ttc
├── images/     #存放圖片
│   ├── ch1/
│   │   ├── variable_example.png
│   │   └── dataType01.png
│   ├── ch2/
│   └── icons/

lib/
├── data/                         # 純資料（每章內容/題目/定義）
│   ├── chapter_data_loader.dart  # load json from assets/data
│   ├── chapter_registry.dart     # chapter 註冊表
│   ├── content_registry.dart     # slide & quiz 註冊表
│   ├── ch1/
│   │   ├── slides.dart
│   ├── ch2/
│   │   ├── slides.dart
│   └── glossary/              # 額外可選：詞彙解釋/重點整理
│       └── ch1_terms.dart
│
├── models/                    # 所有資料模型 class
│   ├── chapter.dart
│   ├── slide_content.dart
│   └── question.dart
│
├── screens/                   # 每一頁畫面邏輯（可再細分子資料夾）
│   ├── home/
│   │   └── home_screen.dart   # 主頁面
│   ├── chapter/
│   │   ├── chapter_screen.dart       # 章節頁面
│   │   ├── chapter_content_page.dart # 章節頁面
│   │   └── presentation_page.dart    # 簡報內容頁面
│   ├── quiz/
│   │   ├── quiz_screen.dart
│   │   └── result_dialog.dart
│   └── encyclopedia/
│       └── encyclopedia_screen.dart   # 之後圖鑑用
│
├── widgets/                   # 可重用 UI 小組件
│   ├── chapter_tile.dart
│   ├── quiz_option_button.dart
│   ├── slide_card.dart
│   └── section_title.dart
│
└── main.dart                  # App 入口

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
