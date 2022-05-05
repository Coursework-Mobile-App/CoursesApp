import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/course.dart';

mixin HomeHandleActionEvent {
  void handleContentItemActionEvent(Article article) {
    print("lol");
    Dependencies.instance.navigator.openArticlePage(article);
  }

  void handleCourseItemActionEvent(Course course) {
    print("lol");
    Dependencies.instance.navigator.openCoursePage(course);
  }

  void handleOnSelectFilterActionEvent() {}

  void handleOnClickProfileActionEvent() {
    Dependencies.instance.navigator.openProfilePage();
  }

  void handleLoadContentActionEvent() {}
}
