import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';

abstract class AlbumsState {}

class InitialState extends AlbumsState {}

class LoadingState extends AlbumsState {}

class HideLoadingState extends AlbumsState {}

class ErrorState extends AlbumsState {
  final String message;
  final int errorCode;

  ErrorState(this.message, this.errorCode);
}

class AlbumListFetchedState extends AlbumsState {
  AlbumListFetchedState();
}

class AlbumPhotosFetchingState extends AlbumsState {
  late final List<AlbumPhotoModel> listAlbumPhotos;

  AlbumPhotosFetchingState({required this.listAlbumPhotos});
}
