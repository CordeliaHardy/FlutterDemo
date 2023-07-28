import 'package:FlutterDemo/features/videos_listing/presentation/bloc/video_listing_bloc.dart';
import 'package:FlutterDemo/features/videos_listing/presentation/widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoListingScreen extends StatefulWidget {
  const VideoListingScreen({Key? key}) : super(key: key);

  @override
  State<VideoListingScreen> createState() => _VideoListingScreenState();
}

class _VideoListingScreenState extends State<VideoListingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<VideoListingBloc>().add(FetchVideoListEvent());
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<VideoListingBloc, VideoListingState>(
        listener: (context, state) {},
        builder: (context, state) => ListView.builder(
          itemBuilder: (_, int index) => VideoPlayerWidget(
              videoUrl:
                  BlocProvider.of<VideoListingBloc>(context).videoList[index]),
          itemCount:
              BlocProvider.of<VideoListingBloc>(context).videoList.length,
        ),
      );
}
