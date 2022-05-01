import 'package:flutter/widgets.dart';
import 'package:courses_app/navigator_panel/main_panel.dart';

class Navigator {
  // Глобальный навигатор
  static final navigatorKey = GlobalKey<NavigatorState>();

  // Локальный навигатор для главного экрана для переключения нижней менюшки
  static final bottomBarKey = GlobalKey<MainScreenState>();

  // Локальный навигатор - методы
  openHomePage() => bottomBarKey.currentState?.openHomePage();
  openPodcastPage() => bottomBarKey.currentState?.openPodcastPage();
  openProfilePage() => bottomBarKey.currentState?.openProfilePage();

  // Глобальный навигатор - методы

  // метод ошибки
  // openErrorPage() => navigatorKey.currentState
  //         ?.pushReplacement(MaterialPageRoute(builder: (context) {
  //       return const ErrDaoNoConnection();
  //     }));

  // openAuthPage() => navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => const AuthScreen(),
  //     ));


  // вроде костыльный метод для открытия главной страницы
  // replaceMainPage() {
  //   navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
  //     builder: (context) => const MainScreen(),
  //   ));
  // }

  // для открытия меню поиска
  // openSearch() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const SearchScreen(),
  //   ));
  // }

  // для открытия курса
  // openCourse() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const CourseScreen(),
  //   ));
  // }

  // для открытия подкаста
  // openPodcast() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const PodcastScreen(),
  //   ));
  // }

  // для открытия статьи
  // openArticle() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const ArticleScreen(),
  //   ));
  // }

  pop() {
    return navigatorKey.currentState?.pop();
  }
}
