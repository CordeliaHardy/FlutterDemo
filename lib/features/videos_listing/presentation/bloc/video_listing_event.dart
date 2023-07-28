part of 'video_listing_bloc.dart';

@immutable
abstract class VideoListingEvent {}

class FetchVideoListEvent extends VideoListingEvent {}

class PlayPauseVideoEvent extends VideoListingEvent {
  String videoUrl;
  VideoPlayPauseEnum enumType;
  PlayPauseVideoEvent({required this.videoUrl, required this.enumType});
}

enum VideoPlayPauseEnum { PLAY_VIDEO, PAUSE_VIDEO, STOP_VIDEO }
