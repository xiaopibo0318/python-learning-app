import '../../models/slide_content.dart';

final variableSlides = [
  SlideContent(
    text: '變數是用來儲存資料的容器，例如：x = 10',
    imageAsset: 'images/ch1/variable_example.png',
  ),
  SlideContent(
    text: '你可以將變數想像成一個「命名的箱子」，裡面可以放資料，例如：\nname = "Alice"\nage = 16',
  ),
];

final datatypeSlides = [
  SlideContent(
    text:
        '<b>整數：</b>\n'
        '<r><b>int</b></r>eger 就是一般的數字，例如 <c>10</c>、<c>42</c>。',
  ),
  SlideContent(
    text:
        '<b>浮點數：</b>\n'
        '<r><b>float</b></r> 也就是小數點，看到有點的都是這個類型。\n'
        '例如 <c>3.14</c>、<c>0.5</c>。',
  ),
  SlideContent(
    text:
        '<b>字串：</b>\n'
        '<r><b>str</b></r>ing 也就是文字。\n'
        '兩邊有耳朵（引號），可以用 <c>"</c> 或 <c>\'</c> 包住。\n'
        '✅ <c>"Hello"</c>、<c>\'123\'</c>\n'
        '❌ 一雙一單不行，例如：<c>"Hello\'</c> 或 <c>\'Hi"</c>',
  ),
  SlideContent(imageAsset: 'images/ch1/dataType01.png'),
];
