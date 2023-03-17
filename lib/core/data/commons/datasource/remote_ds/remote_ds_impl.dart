import 'dart:async';

import 'package:dio/dio.dart';
import 'package:FlutterDemo/core/data/commons/datasource/remote_ds/remote_ds.dart';

class RemoteDataSourceImpl extends IRemoteDataSource {
  Dio dio;

  RemoteDataSourceImpl({required this.dio});

  String baseApi = "https://jsonplaceholder.typicode.com/albums";

  @override
  Future<dynamic> executeGet(
    String path,
  ) async {
    try {
      var response = await dio.get(baseApi + path);
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    } on TimeoutException {
      throw Exception();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
