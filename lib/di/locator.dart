import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:newslist/features/news/data/repositories/news_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<NewsRepository>(() => NewsRepository(dio: locator<Dio>()));
}
