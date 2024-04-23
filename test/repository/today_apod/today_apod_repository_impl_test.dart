import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/data/datasources/network/network_info.dart';
import 'package:flutter_nasa_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:flutter_nasa_app/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_values.dart';
import 'today_apod_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodDataSource>(), MockSpec<NetworkInfo>()])
void main() {
  late MockTodayApodDataSource dataSource;
  late MockNetworkInfo networkInfo;
  late TodayApodRepositoryImpl repository;

  setUp(() {
    dataSource = MockTodayApodDataSource();
    networkInfo = MockNetworkInfo();
    repository = TodayApodRepositoryImpl(
      dataSource: dataSource,
      networkInfo: networkInfo,
    );
  });

  group("Function FetchTodayApod", () {
    // Com Internet = Right ApodModel
    test("Deve retornar uma entidade Apod no lado direito do tipo ApodModel",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenAnswer((_) async => tApodModel());

      final result = await repository.fetchApodToday();

      expect(result, Right<Failure, Apod>(tApodModel()));
    });

    // Com Internet = Left Failure
    test("Deve retornar uma Failure no lado esquerdo do tipo ApiFailure",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(dataSource.fetchTodayApod()).thenThrow(ApiFailure());

      final result = await repository.fetchApodToday();

      expect(result, Left<Failure, Apod>(ApiFailure()));
    });

    // Sem Internet = Left Failure
    test("Deve retornar uma Failure no lado esquerdo do Tipo NoConnection",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      final result = await repository.fetchApodToday();
      verifyNever(dataSource.fetchTodayApod());

      expect(result, Left<Failure, Apod>(NoConnection()));
    });
  });
}
