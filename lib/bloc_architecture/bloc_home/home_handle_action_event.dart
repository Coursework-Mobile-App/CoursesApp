import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/course.dart';
import 'package:courses_app/pages/searchpage.dart';

mixin HomeHandleActionEvent {
  void handleContentItemActionEvent(Article article) {
    print("lol");
    Dependencies.instance.navigator.openArticlePage(article);
  }

  void handleCourseItemActionEvent(Course course) {
    print("lol");
    Dependencies.instance.navigator.openCoursePage(course);
  }

  void handleSearchEvent() {
    print("lol");
    Dependencies.instance.navigator.openSearchPage();
  }

  void handleOnSelectFilterActionEvent() {}

  void handleOnClickProfileActionEvent() {
    Dependencies.instance.navigator.openProfilePage();
  }

  void handleLoadContentActionEvent() {}
}
