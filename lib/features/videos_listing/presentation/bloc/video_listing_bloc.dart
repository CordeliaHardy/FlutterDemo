import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/features/videos_listing/domain/repository/video_listing_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'video_listing_event.dart';

part 'video_listing_state.dart';

class VideoListingBloc extends Bloc<VideoListingEvent, VideoListingState> {
  VideoListingRepo videoListingRepo;

  List<String> videoList = [];

  VideoListingBloc({required this.videoListingRepo})
      : super(VideoListingInitial()) {
    on<VideoListingEvent>((event, emit) async {
      Either<FailureModel, List<String>> result =
          await videoListingRepo.fetchVideoList();
      result.fold((failure) async {}, (data) async {
        videoList.clear();
        videoList.addAll(data);
        emit(VideoListFetchedState());
      });
    });
  }
}
