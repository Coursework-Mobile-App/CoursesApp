import 'package:courses_app/models/article.dart';

abstract class HomeBlocEvent {}

class OnPressContentItemAction extends HomeBlocEvent {
  final Article article;
  OnPressContentItemAction({required this.article});
}

class OnSelectFilterAction extends HomeBlocEvent {
  final String filter;
  OnSelectFilterAction({required this.filter});
}

class OnClickProfileAction extends HomeBlocEvent {
  OnClickProfileAction();
}

class LoadContentAction extends HomeBlocEvent {
  LoadContentAction();
}
