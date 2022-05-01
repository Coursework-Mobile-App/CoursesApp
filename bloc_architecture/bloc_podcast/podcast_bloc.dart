import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'podcast_events.dart';

class PodcastBloc extends BlocBase {
  // stream controllers
  final StreamController<int> _clickPodcastController = StreamController<int>();

  final StreamController<PodcastBlocEvent> _eventController =
      StreamController<PodcastBlocEvent>();

  Sink<int> get _inClickPodcast => _clickPodcastController.sink;
  Stream<int> get outClickPodcast => _clickPodcastController.stream;

  Sink<PodcastBlocEvent> get inEvent => _eventController.sink;
  Stream<PodcastBlocEvent> get _outEvent => _eventController.stream;

  PodcastBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  // альтернатива потоку с UI-событиями
  // void onIncrementButton() {
  //   _handleIncrementCounterEvent();
  // }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
    _clickPodcastController.close();
  }

  void _handleEvent(PodcastBlocEvent event) {
    switch (event) {
      case PodcastBlocEvent.onClickPodcastAction:
        _handleOnClickPodcastEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }

  void _handleOnClickPodcastEvent() {}
}
