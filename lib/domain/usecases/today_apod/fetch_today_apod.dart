import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';
import 'package:flutter_nasa_app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:flutter_nasa_app/domain/usecases/core/usecase.dart';

class FetchTodayApod extends UseCase<Apod, NoParameter> {
  final TodayApodRepository repository;

  FetchTodayApod({required this.repository});
  
  @override
  Future<Either<Failure, Apod>> call(NoParameter parameter) {
    return repository.fetchApodToday();
  }
}
