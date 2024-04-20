import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';

abstract class TodayApodRepository {
  /// Return a Apod data on Right side of either, case is a success, otherwise
  /// return a Failure on left side of either

  Future<Either<Failure, Apod>> fetchApodToday();
}
