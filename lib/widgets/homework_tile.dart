import 'package:flutter/material.dart';
import '../data/homework_registry.dart';
import '../screens/homework/homework_screen.dart';

class HomeworkTile extends StatelessWidget {
  final String chapterTitle;

  const HomeworkTile({super.key, required this.chapterTitle});

  @override
  Widget build(BuildContext context) {
    final homework = HomeworkRegistry.getHomework(chapterTitle);

    if (homework == null) {
      return const SizedBox(); // 沒有作業就不顯示
    }

    return Card(
      color: Colors.orange.shade50,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.assignment, color: Colors.orange),
        title: const Text(
          '📄 回家作業',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('點擊查看作業並提交截圖'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => HomeworkScreen(
                    title: chapterTitle,
                    slides: homework.slides,
                    submitUrl: homework.submitUrl,
                  ),
            ),
          );
        },
      ),
    );
  }
}
