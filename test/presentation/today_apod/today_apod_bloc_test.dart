import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/domain/usecases/today_apod/fetch_today_apod.dart';
import 'package:flutter_nasa_app/presentation/bloc/today_apod_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_values.dart';
import 'today_apod_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchTodayApod>()])

void main(){
  late MockFetchTodayApod fetchTodayApod;
  late TodayApodBloc bloc;

  setUp(() {
    fetchTodayApod = MockFetchTodayApod();
    bloc = TodayApodBloc(fetchTodayApod: fetchTodayApod);
  });

  group("usecase - fetchTodayApod", () {
    // sucesso
    test("Deve emitir LoadingApodState and SuccessApodState", (){
      when(fetchTodayApod(any)).thenAnswer((_) async => Right(tApod()));
      bloc.input.add(FetchApodTodayEvent());

      expect(bloc.stream, emitsInOrder(
        [LoadingTodayApodState(), SuccessTodayApodState(apod: tApod())]
      ));
    });
    // falha
    test("Deve emitir LoadingApodState and ErrorApodState", () {
      when(fetchTodayApod(any)).thenAnswer((_) async => Left(NoConnection()));
      bloc.input.add(FetchApodTodayEvent());

      expect(bloc.stream, emitsInOrder([
        LoadingTodayApodState(), ErrorTodayApodState(msg: NoConnection().msg)
      ]));
    });
  });
}