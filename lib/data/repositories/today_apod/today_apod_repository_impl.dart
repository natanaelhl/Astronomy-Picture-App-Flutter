import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/data/datasources/network/network_info.dart';
import 'package:flutter_nasa_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';
import 'package:flutter_nasa_app/domain/repositories/today_apod/today_apod_repository.dart';

class TodayApodRepositoryImpl implements TodayApodRepository {
  final TodayApodDataSource dataSource;
  final NetworkInfo networkInfo;

  TodayApodRepositoryImpl({required this.dataSource, required this.networkInfo,});

  @override
  Future<Either<Failure, Apod>> fetchApodToday() async{
    if (await networkInfo.isConnected){
      try {
        final model = await dataSource.fetchTodayApod();
        return Right(model);
      } on Failure catch(failure){
        return Left(failure);
      } 
    } else {
      return Left(NoConnection());
    }
  }
}
