import 'dart:async';

import 'package:FlutterDemo/core/utils/testing_key_app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/core/ui/atoms/custom_box_decoration.dart';
import 'package:FlutterDemo/core/utils/app_constants.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_bloc.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_event.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_state.dart';
import 'package:FlutterDemo/features/album_listing/presentation/photosListing/AlbumPhotosListnPage.dart';

class AlbumListingScreen extends StatefulWidget {
  const AlbumListingScreen({Key? key}) : super(key: key);

  @override
  State<AlbumListingScreen> createState() => _AlbumListingScreenState();
}

class _AlbumListingScreenState extends State<AlbumListingScreen> {
  late TextEditingController controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    context.read<AlbumListingBloc>().add(FetchAlbumsEvent(""));
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AlbumListingBloc, AlbumsState>(
        builder: (context, state) {
          if (state is AlbumListFetchedState) {}
          return Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: 'Search Album Here'),
                controller: controller,
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    context
                        .read<AlbumListingBloc>()
                        .add(FetchAlbumsEvent(value));
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView.builder(
                  key: const Key(ALBUM_LISTING_LISTVIEW_PROVIDER),
                  itemBuilder: (_, index) {
                    AlbumModel model = _buildListAlbum()[index];
                    return GestureDetector(
                      child: BoxDecorationCustomWidget(
                        childWidget: _buildAlbumItem(model),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AlbumPhotosListnPage(albumId: model.id!),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: _buildListAlbum().length,
                ),
              ),
            ],
          );
        },
      );

  Text _buildAlbumItem(AlbumModel model) {
    return Text(LABEL_TITLE + model.title!);
  }

  List<AlbumModel> _buildListAlbum() =>
      context.read<AlbumListingBloc>().listAlbum;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
