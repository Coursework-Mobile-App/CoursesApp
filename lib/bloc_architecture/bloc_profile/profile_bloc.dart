import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_events.dart';

class ProfileBloc extends BlocBase {
  // данные Bloc-а
  int _counter = 0;

  // stream controllers
  final StreamController<int> _counterController = StreamController<int>();

  final StreamController<ProfileBlocEvent> _eventController =
      StreamController<ProfileBlocEvent>();

  Sink<int> get _inCounter => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  Sink<ProfileBlocEvent> get inEvent => _eventController.sink;
  Stream<ProfileBlocEvent> get _outEvent => _eventController.stream;

  ProfileBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  // альтернатива потоку с UI-событиями
  void onIncrementButton() {
    _handleIncrementCounterEvent();
  }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
    _counterController.close();
  }

  void _handleEvent(ProfileBlocEvent event) {
    switch (event) {
      case ProfileBlocEvent.setCoursesAction:
        _handleIncrementCounterEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }

  void _handleIncrementCounterEvent() {
    _inCounter.add(++_counter);
  }
}
