import 'package:dartz/dartz.dart';
import 'package:FlutterDemo/core/apirepo/base_api_repo.dart';
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';

abstract class AlbumRepository extends BaseApiRepo {
  AlbumRepository(NetworkInfo networkInfo) : super(networkInfo: networkInfo);

  Future<Either<FailureModel, List<AlbumModel>>> fetchAlbumList(
      String? albumSearch);

  Future<Either<FailureModel, List<AlbumPhotoModel>>> fetchAlbumPhotos(
      int albumId);
}
