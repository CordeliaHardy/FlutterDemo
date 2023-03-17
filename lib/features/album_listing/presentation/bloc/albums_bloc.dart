import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/usecases/album_listing_usecase.dart';
import 'package:FlutterDemo/features/album_listing/domain/usecases/album_photos_listing_usecase.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_event.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_state.dart';

class AlbumListingBloc extends Bloc<AlbumEvents, AlbumsState> {
  final AlbumListingUseCase albumListingUseCase;
  final AlbumPhotosUseCase albumPhotosUseCase;
  List<AlbumModel> listAlbum = [];

  AlbumListingBloc(
      {required this.albumListingUseCase, required this.albumPhotosUseCase})
      : super(InitialState()) {
    on<FetchAlbumsEvent>((event, emit) async {
      Either<FailureModel, List<AlbumModel>> result =
          await albumListingUseCase(event.albumSearchText);
      result.fold((failure) async {}, (data) async {
        listAlbum.clear();
        listAlbum.addAll(data);
        emit(AlbumListFetchedState());
      });
    });
    on<FetchAlbumPhotosEvent>((event, emit) async {
      Either<FailureModel, List<AlbumPhotoModel>> result =
          await albumPhotosUseCase(event.albumId);
      result.fold((failure) async {}, (data) async {
        emit(AlbumPhotosFetchingState(listAlbumPhotos: data));
      });
    });
  }
}
