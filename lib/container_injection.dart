import 'package:flutter_nasa_app/data/datasources/network/network_info.dart';
import 'package:flutter_nasa_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:flutter_nasa_app/data/datasources/today_apod/today_apod_datasource_impl.dart';
import 'package:flutter_nasa_app/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:flutter_nasa_app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:flutter_nasa_app/domain/usecases/today_apod/fetch_today_apod.dart';
import 'package:flutter_nasa_app/presentation/bloc/today_apod_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt getIt = GetIt.instance;

Future<void> setupContainer() async {
  // Externas
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  // Internas
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnection: getIt()));

  // features
  apodToday();
}

void apodToday() {
  getIt.registerLazySingleton<TodayApodDataSource>(
      () => TodayApodDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton<TodayApodRepository>(
      () => TodayApodRepositoryImpl(dataSource: getIt(), networkInfo: getIt()));

  getIt.registerLazySingleton<FetchTodayApod>(
      () => FetchTodayApod(repository: getIt()));

  getIt.registerFactory(() => TodayApodBloc(fetchTodayApod: getIt()));
}
