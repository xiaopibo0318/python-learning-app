class HomeworkSlide {
  final String? imageAsset;
  final String description;
  final String? inputExample;
  final String? outputExample;

  HomeworkSlide({
    this.imageAsset,
    required this.description,
    this.inputExample = "",
    this.outputExample = "",
  });
}
