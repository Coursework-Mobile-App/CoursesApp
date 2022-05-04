import 'package:courses_app/dependencies.dart';

mixin HomeHandleActionEvent {
  void handleContentItemActionEvent() {
    print("lol");
    Dependencies.instance.navigator.openMockPage();
  }

  void handleOnSelectFilterActionEvent() {}

  void handleOnClickProfileActionEvent() {
    Dependencies.instance.navigator.openProfilePage();
  }

  void handleLoadContentActionEvent() {}
}
