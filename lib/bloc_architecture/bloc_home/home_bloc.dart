import 'dart:async';
import 'package:courses_app/dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_events.dart';

class HomeBloc extends BlocBase {
  // stream controllers
  final StreamController<int> _pressCourseController = StreamController<int>();
  final StreamController<int> _pressFilterController = StreamController<int>();
  final StreamController<int> _clickProfileController = StreamController<int>();

  final StreamController<HomeBlocEvent> _eventController =
      StreamController<HomeBlocEvent>();

  Sink<int> get _inPressCourse => _pressCourseController.sink;
  Stream<int> get outPressCourse => _pressCourseController.stream;

  Sink<int> get _inSelectFilter => _pressFilterController.sink;
  Stream<int> get outSelectFilter => _pressFilterController.stream;

  Sink<int> get _inClickProfile => _pressFilterController.sink;
  Stream<int> get outClickProfile => _pressFilterController.stream;

  Sink<HomeBlocEvent> get inEvent => _eventController.sink;
  Stream<HomeBlocEvent> get _outEvent => _eventController.stream;

  HomeBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  // альтернатива потоку с UI-событиями
  // void onPressCourseButton() {
  //   _handlePressCourseActionEvent();
  // }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
    _pressCourseController.close();
    _pressFilterController.close();
    _clickProfileController.close();
  }

  void _handleEvent(HomeBlocEvent event) {
    switch (event) {
      case HomeBlocEvent.onPressCourseAction:
        _handlePressCourseActionEvent();
        break;
      case HomeBlocEvent.onSelectFilterAction:
        _handleOnSelectFilterActionEvent();
        break;
      case HomeBlocEvent.onClickProfileAction:
        _handleOnClickProfileActionEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }

  void _handlePressCourseActionEvent() {
    print("lol");
    Dependencies.instance.navigator.openMockPage();
  }

  void _handleOnSelectFilterActionEvent() {}

  void _handleOnClickProfileActionEvent() {}
}
