import 'package:get_it/get_it.dart';
import 'package:fluttertest/app/services/local_storage_service.dart';
import 'package:fluttertest/presentation/bloc/core/app_bloc.dart';

final locator = GetIt.instance;

Future<void> injector() async {
  // bloc
  locator.registerFactory(() => appBloc());

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
  LocalStorageService _appPreferences = await LocalStorageService().init();
  locator.registerSingleton<LocalStorageService>(_appPreferences);
}
