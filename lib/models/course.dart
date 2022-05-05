import 'package:courses_app/models/item.dart';

import 'lesson.dart';

class Course extends Item {
  final List<Lesson> lessons;
  Course(
    String id,
    String title,
    String section,
    String text,
    String author,
    List<String> tags,
    String coverImage,
    this.lessons,
  ) : super(id, title, section, text, author, tags, coverImage);
}
