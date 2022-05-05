import 'package:courses_app/models/item.dart';

class Article extends Item {
  Article(String id, String title, String section, String text, String author,
      List<String> tags, String coverImage)
      : super(id, title, section, text, author, tags, coverImage);
}
