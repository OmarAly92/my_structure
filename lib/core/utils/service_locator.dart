import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_structure/core/helpers/network/network_status.dart';
import 'package:my_structure/feature/home/presentation/home_screen/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> inIt() async {
    /// Home Feature
    // Blocs
    sl.registerFactory<HomeCubit>(() => HomeCubit());
    // Repository

    // Data Sources

    /// Core
    sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImp(sl()));
    sl.registerLazySingleton<DioConsumer>(
      ({bool isGoldRequest = false}) => DioConsumer(sl()),
    );

    /// External Packages
    sl.registerLazySingleton<Logger>(() => Logger());
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
    sl.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ));
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<InternetConnection>(
      () => InternetConnection.createInstance(
        customCheckOptions: [
          InternetCheckOption(
            uri: Uri.parse('https://www.google.com/'),
          )
        ],
      ),
    );
  }
}
