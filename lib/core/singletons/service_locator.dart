import 'package:bankcard/core/singletons/dio_settings.dart';
import 'package:bankcard/features/main/data/datasources/dio/dio_datasource.dart';
import 'package:bankcard/features/main/data/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
        () => MyCardsRepositoryImpl(dataSource: MyCardsDataSourcheImpl()));
}


