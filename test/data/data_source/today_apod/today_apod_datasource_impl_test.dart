import 'dart:convert';
import 'dart:io';

import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/data/datasources/today_apod/today_apod_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../../fixtures/fixtures.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../test_values.dart';

void main() {
  late MockClient client;
  late TodayApodDataSourceImpl dataSource;

  setUp(() {
    client = MockClient();
    dataSource = TodayApodDataSourceImpl(client: client);
  });

  group("Function getTodayApod", () {
    // sucesso = Apod
    test("Deve retornar um ApodModel", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response.bytes(
          utf8.encode(fixture("image_response.json")), 200));
      final result = await dataSource.fetchTodayApod();
      expect(result, tApodModel());
      
    });

    // falha1 = ApiFailure statusCode != 200
    test(
        "Deve jogar (throw) uma ApiFailure quando a api retornar um valor diferente de 200",
        () async {
      when(client.get(any)).thenAnswer((_) async =>
          http.Response.bytes(utf8.encode("image_reponse.json"), 500));
      expect(() => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });

    // falha2 = ApiFailure client exception
    test("Deve jogar (throw) uma ApiFailure quando houver um exception",
        () async {
      when(client.get(any)).thenThrow(const SocketException("message"));

      expect(() => dataSource.fetchTodayApod(), throwsA(isA<ApiFailure>()));
    });
  });
}
