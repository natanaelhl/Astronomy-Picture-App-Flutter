import 'package:flutter_nasa_app/data/models/apod_model.dart';

abstract class TodayApodDataSource{
  /// Return a [ApodModel] date case is a success, otherwise
  /// throw a [Failure]
  Future<ApodModel> fetchTodayApod();
}

