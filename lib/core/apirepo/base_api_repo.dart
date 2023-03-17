import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/core/utils/api_constant.dart';

import '../utils/app_constants.dart';

abstract class BaseApiRepo {
  final NetworkInfo networkInfo;

  BaseApiRepo({required this.networkInfo});

  Future<Either<FailureModel, T>> baseApiMethod<T>(
      Future<Either<FailureModel, T>> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioError catch (e) {
      String statusMessage = SOMETHING_WENT_WRONG_ON_API_SIDE;
      int statusCode = 0;
      if (e.response != null) {
        statusCode = e.response!.statusCode!;

        if (statusCode == 500 || statusCode >= 400 && statusCode <= 402) {
          statusMessage = e.response!.statusMessage!;
        } else {
          statusMessage =
              e.response!.statusMessage ?? SOMETHING_WENT_WRONG_ON_API_SIDE;
        }
      } else {
        if (e.error is SocketException) {
          return internetException();
        }
      }
      return Left(FailureModel(
        errorMessage: statusMessage,
        statusCode: statusCode,
      ));
    } on TimeoutException {
      return Left(defaultFailure());
    } on SocketException catch (e) {
      return internetException();
    } catch (e) {
      if (e.toString().contains(SOCKET_EXCEPTION)) {
        return internetException();
      }
      return Left(defaultFailure());
    } finally {}
  }

  FailureModel defaultFailure() {
    return FailureModel(
      errorMessage: SOMETHING_WENT_WRONG_ON_API_SIDE,
    );
  }

  Left<FailureModel, T> internetException<T>() {
    return Left(
      FailureModel(
        errorMessage: INTERNET_CONNECTION,
        statusCode: INTERNET_CONNECTION_ERROR_STATUS_CODE,
      ),
    );
  }
}
