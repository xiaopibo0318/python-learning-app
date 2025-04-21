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
├── data/       # 存放章節內容與測驗題目的 JSON 檔案
│   ├── ch1/
│   │   ├── contents.json
│   │   └── quiz.json
│   └── ch2/
├── fonts/      # 自訂中文字體
│   └── GenSenRounded2-M.ttc
├── images/     # 圖片資源（教學插圖、按鈕圖示等）
│   ├── ch1/
│   │   ├── variable_example.png
│   │   └── dataType01.png
│   ├── ch2/
│   └── icons/

lib/
├── data/                         # 純資料邏輯（章節註冊、載入器等）
│   ├── chapter_data_loader.dart
│   ├── chapter_registry.dart
│   ├── content_registry.dart
│   ├── ch1/slides.dart
│   └── glossary/ch1_terms.dart
├── models/                       # 資料模型（Chapter、Question、SlideContent）
├── screens/                      # 畫面邏輯（首頁、章節、測驗、圖鑑）
│   ├── home/
│   ├── chapter/
│   ├── quiz/
│   └── encyclopedia/
├── widgets/                      # 可重用組件（按鈕、卡片、標題等）
└── main.dart                     # App 入口點


