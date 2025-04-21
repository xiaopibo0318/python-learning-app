## 📚 Python 學習 App

這是一款為學習 Python 基礎知識所設計的 Flutter App。


## 🚀 功能介紹

- ✅ 簡報式內容瀏覽（圖文混合教學）
- ✅ 測驗系統（答對才能解鎖下一章）
- ✅ 題目即時回饋（正確綠色、錯誤紅色）
- ✅ 解鎖進度紀錄（未來可擴充本地儲存）
- ✅ 自訂字體、手寫風格介面
- ✅ Flutter 多平台支援（Android / Web）

<summary><strong>📁 專案資料夾結構</strong></summary>

<pre>

assets/
├── data/              存放章節內容與測驗題目的 JSON
│   ├── ch1/
│   │   ├── contents.json
│   │   └── quiz.json
│   └── ch2/
├── fonts/             自訂中文字體
│   └── GenSenRounded2-M.ttc
├── images/            教學插圖與介面圖示
│   ├── ch1/
│   │   ├── variable_example.png
│   │   └── dataType01.png
│   ├── ch2/
│   └── icons/

lib/
├── data/              純資料邏輯（載入 JSON / 註冊表）
│   ├── chapter_data_loader.dart
│   ├── chapter_registry.dart
│   ├── content_registry.dart
│   ├── ch1/
│   │   └── slides.dart
│   └── glossary/
│       └── ch1_terms.dart
├── models/            資料模型定義（Chapter、Question、Slide）
│   ├── chapter.dart
│   ├── question.dart
│   └── slide_content.dart
├── screens/           各主要頁面邏輯
│   ├── home/
│   │   └── home_screen.dart
│   ├── chapter/
│   │   ├── chapter_screen.dart
│   │   ├── chapter_content_page.dart
│   │   └── presentation_page.dart
│   ├── quiz/
│   │   ├── quiz_screen.dart
│   │   └── result_dialog.dart
│   └── encyclopedia/
│       └── encyclopedia_screen.dart
├── widgets/           可重用 UI 組件（按鈕、卡片、標題）
│   ├── chapter_tile.dart
│   ├── quiz_option_button.dart
│   ├── slide_card.dart
│   └── section_title.dart
└── main.dart          App 進入點

</pre>

