class Lesson {
  final String id;
  final String title;
  final String author;
  final String coverImage;
  final List<String> images;
  final List<String> videos;
  final List<String> texts;

  Lesson(this.id, this.title, this.author /*, this.tags*/, this.texts,
      this.images, this.videos, this.coverImage);
}
