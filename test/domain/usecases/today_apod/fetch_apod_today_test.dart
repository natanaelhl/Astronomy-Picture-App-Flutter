import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';
import 'package:flutter_nasa_app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:flutter_nasa_app/domain/usecases/core/usecase.dart';
import 'package:flutter_nasa_app/domain/usecases/today_apod/fetch_today_apod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'fetch_apod_today_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodRepository>()])
void main() {
  late MockTodayApodRepository repository;
  late FetchTodayApod usecase;

  setUp(() {
    repository = MockTodayApodRepository();
    usecase = FetchTodayApod(repository: repository);
  });
  // Retorna Apod
  test("Deve retornar uma entidade Apod no lado Direito", () async {
    //Cenário
    when(repository.fetchApodToday())
        .thenAnswer((_) async => Right<Failure, Apod>(tApod()));
    //Ação
    final result = await usecase(NoParameter());
    //Esperado
    expect(result, Right<Failure, Apod>(tApod()));
  });

  test("Deve retornar um Failure no lado esquerdo do either", () async {
    //Cenário
    when(repository.fetchApodToday())
        .thenAnswer((_) async => Left<Failure, Apod>(tNoConnection()));
    //Ação
    final result = await usecase(NoParameter());
    //Esperado
    expect(result, Left<Failure, Apod>(tNoConnection()));
  });
}
