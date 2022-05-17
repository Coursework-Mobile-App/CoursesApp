import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_handle_action_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/article.dart';
import 'profile_events.dart';

class ProfileBloc extends BlocBase with ProfileHandleActionEvent {
  // данные Bloc-а

  static List<Article> p = [
    Article('7', 'Салаты', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/4198024/pexels-photo-4198024.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('8', 'Выбор дивана', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/6315802/pexels-photo-6315802.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('9', 'Стильные кроссовки', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/8386605/pexels-photo-8386605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('10', 'Умные часы', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/1682821/pexels-photo-1682821.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('11', 'Лучшие фильмы 2022', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/2910028/pexels-photo-2910028.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('12', 'Красивые виды Москвы', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/753339/pexels-photo-753339.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('13', 'Лучшие отели Петербурга', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('14', 'Писатели 19 века', 'П', 'd', 'Мария', [''],
        'https://globalmsk.ru/usr/person/big-person-15629077401.jpg'),
    Article('15', 'Работа - уборщик туалетов', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/9462143/pexels-photo-9462143.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('17', 'Самый модный дом', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/1187777/pexels-photo-1187777.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('15', 'Становление Лос-Анджелеса', 'П', 'd', 'Мария', [''],
        'https://images.pexels.com/photos/10971412/pexels-photo-10971412.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Article('18', 'Кибербулинг', 'П', 'd', 'Мария', [''],
        'https://media.istockphoto.com/photos/cyber-bullying-concept-people-using-notebook-computer-laptop-for-picture-id1170461091?s=612x612'),
  ];
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
