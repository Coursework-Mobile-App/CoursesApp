import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_handle_action_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_events.dart';

class ProfileBloc extends BlocBase with ProfileHandleActionEvent {
  // данные Bloc-а

  final StreamController<ProfileBlocEvent> _eventController =
      StreamController<ProfileBlocEvent>();

  Sink<ProfileBlocEvent> get inEvent => _eventController.sink;
  Stream<ProfileBlocEvent> get _outEvent => _eventController.stream;

  ProfileBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
  }

  void _handleEvent(ProfileBlocEvent event) {
    switch (event.runtimeType) {
      case OnFavouritesClick:
        handleOnClickFavouriteEvent();
        break;
      case OnPassedClick:
        handleOnClickPassedEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }
}
