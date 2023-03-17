import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/core/ui/atoms/custom_box_decoration.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_bloc.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_event.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_state.dart';

class AlbumPhotosListingScreen extends StatefulWidget {
  final int albumId;

  const AlbumPhotosListingScreen({Key? key, required this.albumId})
      : super(key: key);

  @override
  State<AlbumPhotosListingScreen> createState() =>
      _AlbumPhotosListingScreenState();
}

class _AlbumPhotosListingScreenState extends State<AlbumPhotosListingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AlbumListingBloc>().add(FetchAlbumPhotosEvent(widget.albumId));
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AlbumListingBloc, AlbumsState>(
        builder: (context, state) {
          if (state is AlbumPhotosFetchingState) {
            return ListView.builder(
              itemBuilder: (_, index) {
                AlbumPhotoModel model = state.listAlbumPhotos[index];
                return GestureDetector(
                  onTap: () {},
                  child: BoxDecorationCustomWidget(
                    childWidget: _buildPhotos(model),
                  ),
                );
              },
              itemCount: state.listAlbumPhotos.length,
            );
          }
          return Center(child: Text('Loading...'));
        },
      );

  Widget _buildPhotos(AlbumPhotoModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          model.thumbnailUrl!,
        ),
        SizedBox(width: 15.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text("Title : ${model.title!}")),

              Text("AlbumId : ${model.albumId!}")],
          ),
        )
      ],
    );
  }
}
