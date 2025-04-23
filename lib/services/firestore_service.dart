import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chapter.dart';
import '../models/question.dart';
import '../models/slide_content.dart';
import '../models/homework_slide.dart';
import '../utils/logger.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// 讀取所有章節
  static Future<List<Chapter>> fetchChapters() async {
    final snapshot = await _db.collection('chapters').get();

    return Future.wait(
      snapshot.docs.map((doc) async {
        final data = doc.data();

        final contentsSnap = await doc.reference.collection('contents').get();
        final quizzesSnap = await doc.reference.collection('quizzes').get();
        return Chapter(
          id: data["id"] ?? "0",
          title: data['title'] ?? '未命名章節',
          isUnlocked: data['unlocked'] ?? false,
          contents:
              contentsSnap.docs
                  .map(
                    (c) => Content(
                      topic: c['topic'],
                      description: c['description'],
                    ),
                  )
                  .toList(),
          questions:
              quizzesSnap.docs
                  .map(
                    (q) => Question(
                      question: q['question'],
                      choices: List<String>.from(q['options']),
                      answer: q['answer'],
                    ),
                  )
                  .toList(),
        );
      }).toList(),
    );
  }

  //讀取PresentationPage
  static Future<List<SlideContent>> fetchSlides(
    String chapterId,
    String topic,
  ) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('chapters')
            .doc('ch${chapterId}')
            .collection('contents')
            .where('topic', isEqualTo: topic)
            .limit(1)
            .get();

    if (snapshot.docs.isEmpty) {
      AppLogger.chapter.warning('❗ 沒有找到 topic：$topic');
      return [];
    }

    final data = snapshot.docs.first.data();
    final List slidesRaw = data['slides'] ?? [];

    return slidesRaw
        .map((e) => SlideContent(text: e['text'], imageAsset: e['imageUrl']))
        .toList();
  }

  static Future<String> fetchSubmitUrl(String chapterId) async {
    final doc =
        await FirebaseFirestore.instance
            .collection('chapters')
            .doc('ch${chapterId}')
            .get();

    return doc.data()?['submitUrl'] ?? '';
  }

  static Future<List<HomeworkSlide>> fetchHomeworks(String chapterId) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('chapters')
            .doc('ch${chapterId}')
            .collection('homeworks')
            .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return HomeworkSlide(
        description: data['description'] ?? '',
        inputExample: data['inputExample'] ?? '',
        outputExample: data['outputExample'] ?? '',
        imageAsset: data['imageAsset'] ?? '',
      );
    }).toList();
  }

  // 更新章節解鎖狀態
  static Future<void> unlockChapter(int chapterId) async {
    try {
      // 假設你的章節 ID 是數字，這裡是更新章節的解鎖狀態
      await _db.collection('chapters').doc('ch$chapterId').update({
        'unlocked': true, // 將該章節的 unlocked 設為 true
      });
      AppLogger.chapter.info('解鎖第 $chapterId 章');
    } catch (e) {
      AppLogger.chapter.severe('解鎖第 $chapterId 章失敗: $e');
    }
  }
}
