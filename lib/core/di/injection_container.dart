import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info.dart';
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info_impl.dart';
import 'package:FlutterDemo/core/data/commons/datasource/remote_ds/remote_ds.dart';
import 'package:FlutterDemo/core/data/commons/datasource/remote_ds/remote_ds_impl.dart';

final sl = GetIt.instance;

Future<void> initInjectionContainer(bool isProd) async {
  //Preference Helper

  //Common
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());

//! Core
  Dio dio = Dio();
  sl.registerSingleton<Dio>(dio);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<IRemoteDataSource>(
      () => RemoteDataSourceImpl(dio: sl()));
}
