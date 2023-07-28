import 'package:FlutterDemo/core/constants/video_listing_constants.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/features/videos_listing/domain/repository/video_listing_repo.dart';
import 'package:dartz/dartz.dart';

class VideoListingRepositoryImpl extends VideoListingRepo {
  @override
  Future<Either<FailureModel, List<String>>> fetchVideoList() async {
    try {
      return Right(videoListingConstants);
    } catch (e) {
      return Left(FailureModel(errorMessage: "Something went Wrong"));
    }
  }
}
