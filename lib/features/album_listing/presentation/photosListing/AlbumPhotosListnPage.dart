import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FlutterDemo/core/di/injection_container.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_bloc.dart';
import 'package:FlutterDemo/features/album_listing/presentation/photosListing/AlbumPhotosListingScreen.dart';

class AlbumPhotosListnPage extends StatefulWidget {
  final int albumId;

  const AlbumPhotosListnPage({Key? key, required this.albumId})
      : super(key: key);

  @override
  State<AlbumPhotosListnPage> createState() => _AlbumPhotosListnPageState();
}

class _AlbumPhotosListnPageState extends State<AlbumPhotosListnPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => AlbumListingBloc(
              albumListingUseCase: sl(), albumPhotosUseCase: sl()),
          child: AlbumPhotosListingScreen(
            albumId: widget.albumId,
          ),
        ),
      );
}
