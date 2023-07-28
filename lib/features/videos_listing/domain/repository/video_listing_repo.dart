import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:dartz/dartz.dart';

abstract class VideoListingRepo {
  Future<Either<FailureModel, List<String>>> fetchVideoList();
}
