import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';

mixin HomeHandleActionEvent {
  void handleContentItemActionEvent(Article article) {
    print("lol");
    Dependencies.instance.navigator.openArticlePage(article);
  }

  void handleOnSelectFilterActionEvent() {}

  void handleOnClickProfileActionEvent() {
    Dependencies.instance.navigator.openProfilePage();
  }

  void handleLoadContentActionEvent() {}
}
