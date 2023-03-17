import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FlutterDemo/core/di/injection_container.dart';
import 'package:FlutterDemo/core/utils/testing_key_app_constants.dart';
import 'package:FlutterDemo/features/album_listing/presentation/AlbumListnScreen.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_bloc.dart';

class AlbumListingPage extends StatefulWidget {
  const AlbumListingPage({Key? key}) : super(key: key);

  @override
  State<AlbumListingPage> createState() => _AlbumListingPageState();
}

class _AlbumListingPageState extends State<AlbumListingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        key: const Key(ALBUM_LISTING_SCAFFOLD),
        body: SafeArea(
          child: BlocProvider(
            key: const Key(ALBUM_LISTING_PROVIDER),
            create: (BuildContext context) => AlbumListingBloc(
                albumListingUseCase: sl(), albumPhotosUseCase: sl()),
            child: const AlbumListingScreen(),
          ),
        ),
      );
}
