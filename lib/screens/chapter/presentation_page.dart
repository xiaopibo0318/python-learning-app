import 'package:flutter/material.dart';
import '../../../../models/slide_content.dart';
import '../../utils.dart';

class PresentationPage extends StatefulWidget {
  final String title;
  final List<SlideContent> slides;

  const PresentationPage({
    super.key,
    required this.title,
    required this.slides,
  });

  @override
  _PresentationPageState createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final slide = widget.slides[currentPage];
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (slide.imageAsset != null)
                        Image.asset(
                          slide.imageAsset!,
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        ),
                      if (slide.text != null) ...[
                        const SizedBox(height: 16),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: screenWidth < 400 ? 16 : 18,
                              color: Colors.black,
                            ),
                            children: buildStyledText(slide.text!),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed:
                      currentPage > 0
                          ? () => setState(() => currentPage--)
                          : null,
                  child: Text(
                    '← 上一頁',
                    style: const TextStyle(
                      fontFamily: 'HandWrite', // ✅ 使用你的手寫字體
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  '${currentPage + 1} / ${widget.slides.length}',
                  style: const TextStyle(
                    fontFamily: 'HandWrite',
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed:
                      currentPage < widget.slides.length - 1
                          ? () => setState(() => currentPage++)
                          : null,
                  child: Text(
                    '下一頁 →',
                    style: const TextStyle(
                      fontFamily: 'HandWrite',
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
