import 'package:flutter/widgets.dart';
import 'package:courses_app/main_screen.dart';

class Navigator {

  // Глобальный навигатор
  static final navigatorKey = GlobalKey<NavigatorState>();
  // Локальный навигатор для главного экрана для переключения нижней менюшки
  static final bottomBarKey = GlobalKey<MainScreenState>();

  openHomePage() => bottomBarKey.currentState?.openHomePage();
  openPodcastPage() => bottomBarKey.currentState?.openPodcastPage();
  openProfilePage() => bottomBarKey.currentState?.openProfilePage();
}