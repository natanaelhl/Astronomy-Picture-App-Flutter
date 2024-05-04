import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';
import 'package:flutter_nasa_app/domain/usecases/core/usecase.dart';
import 'package:flutter_nasa_app/domain/usecases/today_apod/fetch_today_apod.dart';

part 'today_apod_event.dart';
part 'today_apod_state.dart';

class TodayApodBloc {
  FetchTodayApod fetchTodayApod;

  TodayApodBloc({required this.fetchTodayApod}) {
    _inputController.stream.listen(_blocEventController);
  }

  // Utilizado para controllar eventos
  final StreamController<TodayApodEvent> _inputController =
      StreamController<TodayApodEvent>();
  final StreamController<TodayApodState> _outputController =
      StreamController<TodayApodState>();

  Sink<TodayApodEvent> get input => _inputController.sink;
  Stream<TodayApodState> get stream => _outputController.stream;

  void _blocEventController(TodayApodEvent event) {
    _outputController.add(LoadingTodayApodState());

    if (event is FetchApodTodayEvent) {
      fetchTodayApod(NoParameter()).then((value) => value.fold(
          (l) => _outputController.add(ErrorTodayApodState(msg: l.msg)),
          (r) => _outputController.add(SuccessTodayApodState(apod: r))));
    }
  }
}
