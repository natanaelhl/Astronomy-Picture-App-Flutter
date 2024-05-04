import 'dart:convert';

import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:flutter_nasa_app/data/models/apod_model.dart';
import 'package:http/http.dart' as http;

class TodayApodDataSourceImpl implements TodayApodDataSource {
  final http.Client client;

  TodayApodDataSourceImpl({required this.client});
  @override
  Future<ApodModel> fetchTodayApod() async{
    http.Response response;
    try {
      response = await client.get(Uri.parse("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"));
    } catch (e) {
      throw ApiFailure();
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      return ApodModel.fromJson(json);
    } else {
      throw ApiFailure();
    }
  }

}