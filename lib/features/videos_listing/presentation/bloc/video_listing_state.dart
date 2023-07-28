part of 'video_listing_bloc.dart';

@immutable
abstract class VideoListingState {}

class VideoListingInitial extends VideoListingState {}

class VideoListFetchedState extends VideoListingState {
  VideoListFetchedState();
}
