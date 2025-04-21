## 📚 Python 學習 App

這是一款為學習 Python 基礎知識所設計的 Flutter App。


## 🚀 功能介紹

- ✅ 簡報式內容瀏覽（圖文混合教學）
- ✅ 測驗系統（答對才能解鎖下一章）
- ✅ 題目即時回饋（正確綠色、錯誤紅色）
- ✅ 解鎖進度紀錄（未來可擴充本地儲存）
- ✅ 自訂字體、手寫風格介面
- ✅ Flutter 多平台支援（Android / Web）

# 當前資料夾架構如下

assets/
├── data/
│   ├── ch1/
│   │   ├── contents.json
│   │   └── quiz.json
│   └── ch2/
│       # 存放章節內容與測驗題目的 JSON 檔案
├── fonts/
│   └── GenSenRounded2-M.ttc
│       # 自訂中文字體
├── images/
│   ├── ch1/
│   │   ├── variable_example.png
│   │   └── dataType01.png
│   ├── ch2/
│   └── icons/
│       # 圖片資源（教學插圖、按鈕圖示等）

lib/
├── data/
│   ├── chapter_data_loader.dart
│   ├── chapter_registry.dart
│   ├── content_registry.dart
│   ├── ch1/slides.dart
│   └── glossary/ch1_terms.dart
│       # 純資料邏輯（章節註冊、載入器等）
├── models/
│   ├── chapter.dart
│   ├── slide_content.dart
│   └── question.dart
│       # 資料模型（Chapter、Question、SlideContent）
├── screens/
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
│       # 畫面邏輯（首頁、章節、測驗、圖鑑）
├── widgets/
│   ├── chapter_tile.dart
│   ├── quiz_option_button.dart
│   ├── slide_card.dart
│   └── section_title.dart
│       # 可重用 UI 組件（按鈕、卡片、標題等）
└── main.dart
    # App 入口

