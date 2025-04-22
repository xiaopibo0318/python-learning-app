import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/homework_slide.dart';
import '../../widgets/code_block.dart';
import '../../services/firestore_service.dart';

class HomeworkScreen extends StatefulWidget {
  final String chapterId; // 用章節 ID 來讀取對應作業
  final String submitUrl; // Google 表單連結

  const HomeworkScreen({
    super.key,
    required this.chapterId,
    required this.submitUrl,
  });

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  List<HomeworkSlide> slides = [];
  int currentPage = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHomework();
  }

  Future<void> _loadHomework() async {
    final data = await FirestoreService.fetchHomeworks(widget.chapterId);
    setState(() {
      slides = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (slides.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('作業')),
        body: const Center(child: Text('尚未有作業內容')),
      );
    }

    final slide = slides[currentPage];
    final isLastPage = currentPage == slides.length - 1;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.chapterId} - 作業')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (slide.imageAsset != null && slide.imageAsset!.isNotEmpty)
                Center(child: Image.network(slide.imageAsset!)),
              const SizedBox(height: 16),
              Text(slide.description, style: const TextStyle(fontSize: 18)),
              if (slide.inputExample != null &&
                  slide.inputExample!.isNotEmpty) ...[
                CodeBlock(
                  title: '🔹 Input 範例',
                  content: slide.inputExample!,
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
              if (slide.outputExample != null &&
                  slide.outputExample!.isNotEmpty) ...[
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
                      currentPage < slides.length - 1
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
