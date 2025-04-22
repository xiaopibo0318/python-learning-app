import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chapter.dart';
import '../models/question.dart';
import '../models/homework_slide.dart';

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
        final homeworksSnap = await doc.reference.collection('homeworks').get();

        HomeworkConfig? homeworkConfig;
        if (homeworksSnap.docs.isNotEmpty) {
          homeworkConfig = HomeworkConfig(
            slides:
                homeworksSnap.docs
                    .map(
                      (h) => HomeworkSlide(
                        description: h['title'],
                        inputExample: h['inputExample'],
                        outputExample: h['outputExample'],
                      ),
                    )
                    .toList(),
            submitUrl: homeworksSnap.docs.first.data()['submitUrl'] ?? '',
          );
        }
        return Chapter(
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
          homeworkConfig: homeworkConfig,
        );
      }).toList(),
    );
  }
}
