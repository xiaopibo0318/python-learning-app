import '../../models/homework_slide.dart';

final List<HomeworkSlide> ch1HomeworkSlides = [
  HomeworkSlide(
    description: '題目 1️⃣：請定義 name, age, height 並依格式輸出。',
    inputExample: """
小明
18
172.5
""",
    outputExample: '''
Hello, I am 小明.
I am 18 years old.
My height is 172.5 cm.
''',
  ),
  HomeworkSlide(
    description: '題目 2️⃣：交換兩個數字a以及b',
    inputExample: '''
5
10
''',
    outputExample: '''
After swap:
a = 10
b = 5
''',
  ),
];
