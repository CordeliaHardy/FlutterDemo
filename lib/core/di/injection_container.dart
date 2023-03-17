import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info.dart';
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info_impl.dart';
import 'package:FlutterDemo/core/data/commons/datasource/remote_ds/remote_ds.dart';
import 'package:FlutterDemo/core/data/commons/datasource/remote_ds/remote_ds_impl.dart';
import 'package:FlutterDemo/features/album_listing/data/datasource/album_data_source.dart';
import 'package:FlutterDemo/features/album_listing/data/datasource/album_data_source_impl.dart';
import 'package:FlutterDemo/features/album_listing/data/repository/album_repository_impl.dart';
import 'package:FlutterDemo/features/album_listing/domain/repository/album_repository.dart';
import 'package:FlutterDemo/features/album_listing/domain/usecases/album_listing_usecase.dart';
import 'package:FlutterDemo/features/album_listing/domain/usecases/album_photos_listing_usecase.dart';

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

  sl.registerSingleton<AlbumDataSource>(
      AlbumDataSourceImpl(remoteDataSource: sl()));
  sl.registerSingleton<AlbumRepository>(
      AlbumsRepositoryImpl(networkInfo: sl(), albumDataSource: sl()));
  sl.registerLazySingleton(() => AlbumListingUseCase(sl()));
  sl.registerLazySingleton(() => AlbumPhotosUseCase(sl()));
}
