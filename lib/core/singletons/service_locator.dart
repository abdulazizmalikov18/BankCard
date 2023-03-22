import 'package:bankcard/core/singletons/dio_settings.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton(DioSettings.new);
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
