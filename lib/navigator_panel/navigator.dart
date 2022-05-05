import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/course.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:courses_app/pages/articlepage.dart';
import 'package:courses_app/pages/coursepage.dart';
import 'package:courses_app/pages/mockpage.dart';
import 'package:courses_app/pages/podcastpage.dart';
import 'package:courses_app/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:courses_app/navigator_panel/main_panel.dart';

class AppNavigator {
  // Глобальный навигатор
  static final navigatorKey = GlobalKey<NavigatorState>();

  // Локальный навигатор для главного экрана для переключения нижней менюшки
  static final bottomBarKey = GlobalKey<MainScreenState>();

  // Локальный навигатор - методы
  openHomePage() => bottomBarKey.currentState?.openHomePage();
  openPodcastsPage() => bottomBarKey.currentState?.openPodcastsPage();
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

  openMockPage() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const MockPage(),
      ));

  openPodcastPage() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const PodcastPage(),
      ));

  openArticlePage(Article article) =>
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => ArticlePage(
          article: article,
        ),
      ));

  openCoursePage(Course course) =>
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => CoursePage(
          course: course,
        ),
      ));

  // openArticlePage() => navigatorKey.currentState?.push(MaterialPageRoute(
  // builder: (context) => PresentationWidget(),
  // ));

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
