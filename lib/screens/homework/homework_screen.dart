import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/homework_slide.dart';
import '../../widgets/code_block.dart';

class HomeworkScreen extends StatefulWidget {
  final String title;
  final List<HomeworkSlide> slides;
  final String submitUrl; // Google 表單連結

  const HomeworkScreen({
    super.key,
    required this.title,
    required this.slides,
    required this.submitUrl,
  });

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final slide = widget.slides[currentPage];
    final isLastPage = currentPage == widget.slides.length - 1;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.title} - 作業')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (slide.imageAsset != null)
                Center(child: Image.asset(slide.imageAsset!)),
              const SizedBox(height: 16),
              Text(slide.description, style: const TextStyle(fontSize: 18)),
              if (slide.inputExample != null) ...[
                CodeBlock(
                  title: '🔹 Input 範例',
                  content: slide.inputExample!,
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
              if (slide.outputExample != null) ...[
                CodeBlock(
                  title: '🔹 Output 範例',
                  content: slide.outputExample!,
                  backgroundColor: Colors.green.shade50,
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed:
                  currentPage > 0 ? () => setState(() => currentPage--) : null,
              child: const Text('← 上一題'),
            ),
            isLastPage
                ? ElevatedButton(
                  onPressed: () => launchUrl(Uri.parse(widget.submitUrl)),
                  child: const Text('提交作業'),
                )
                : TextButton(
                  onPressed:
                      currentPage < widget.slides.length - 1
                          ? () => setState(() => currentPage++)
                          : null,
                  child: const Text('下一題 →'),
                ),
          ],
        ),
      ),
    );
  }
}
