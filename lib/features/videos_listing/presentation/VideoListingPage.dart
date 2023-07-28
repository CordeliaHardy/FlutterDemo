import 'package:FlutterDemo/features/videos_listing/data/repository/video_listing_repo_impl.dart';
import 'package:FlutterDemo/features/videos_listing/presentation/VideoListingScreen.dart';
import 'package:FlutterDemo/features/videos_listing/presentation/bloc/video_listing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoListingPage extends StatelessWidget {
  const VideoListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) =>
            VideoListingBloc(videoListingRepo: VideoListingRepositoryImpl()),
        child: const VideoListingScreen(),
      );
}
