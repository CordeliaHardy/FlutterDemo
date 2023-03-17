import 'package:dartz/dartz.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';

abstract class UseCase<Type, Params> {
  Future<Either<FailureModel, Type>> call(Params params);
}
