import 'package:flutter/material.dart';

class HomeworkTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HomeworkTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Card(
          color: Colors.orange.shade50,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(Icons.assignment, color: Colors.orange),
            title: Text(
              '$title 作業',
              style: const TextStyle(
                fontFamily: 'GenSen',
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('點擊查看作業內容與繳交方式'),
          ),
        ),
      ),
    );
  }
}
