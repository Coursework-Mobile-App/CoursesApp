abstract class HomeBlocEvent {}

class OnPressContentItemAction extends HomeBlocEvent {
  OnPressContentItemAction();
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
