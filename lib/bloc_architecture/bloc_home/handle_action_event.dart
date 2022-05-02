import 'package:courses_app/dependencies.dart';

mixin HandleActionEvent {
  void handlePressCourseActionEvent() {
    print("lol");
    Dependencies.instance.navigator.openMockPage();
  }

  void handleOnSelectFilterActionEvent() {}

  void handleOnClickProfileActionEvent() {}

  void handleLoadContentActionEvent() {
    
  }
}