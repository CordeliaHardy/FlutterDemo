import 'dart:async';

import 'package:FlutterDemo/core/data/commons/datasource/remote_ds/remote_ds.dart';
import 'package:FlutterDemo/features/album_listing/data/datasource/album_data_source.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';

class AlbumDataSourceImpl implements AlbumDataSource {
  AlbumDataSourceImpl({required this.remoteDataSource});

  late final IRemoteDataSource remoteDataSource;

  @override
  Future<List<AlbumModel>> fetchAlbumList(String? albumSearch) async {
    String path = "";
    if (albumSearch != null && albumSearch.isNotEmpty) {
      //https://jsonplaceholder.typicode.com/albums?title={TITLE}
      path = "?title=$albumSearch";
    }
    List<AlbumModel> data = [];

    var response = await remoteDataSource.executeGet(path);
    response.data.forEach((v) {
      data.add(AlbumModel.fromJson(v));
    });
    return data;
  }

  @override
  Future<List<AlbumPhotoModel>> fetchAlbumPhotos(int albumId) async {
    String path = "/$albumId/photos";

    List<AlbumPhotoModel> data = [];

    var response = await remoteDataSource.executeGet(path);
    response.data.forEach((v) {
      data.add(AlbumPhotoModel.fromJson(v));
    });

    return data;
  }
}
