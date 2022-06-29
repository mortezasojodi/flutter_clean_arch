import 'package:get_it/get_it.dart';
import 'package:fluttertest/app/services/localStroage.dart';

final locator = GetIt.instance;

void init() {
  // // bloc
  // locator.registerFactory(() => WeatherBloc(locator()));

  // // usecase
  // locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  // // repository
  // locator.registerLazySingleton<WeatherRepository>(
  //   () => WeatherRepositoryImpl(
  //     remoteDataSource: locator(),
  //   ),
  // );

  // // data source
  // locator.registerLazySingleton<RemoteDataSource>(
  //   () => RemoteDataSourceImpl(
  //     client: locator(),
  //   ),
  // );

  // external
  locator.registerLazySingleton(() => AppPreferences().init());
}
