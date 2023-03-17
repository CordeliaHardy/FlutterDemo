import 'package:dartz/dartz.dart';
import 'package:FlutterDemo/core/data/commons/datasource/network_info/network_info.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/features/album_listing/data/datasource/album_data_source.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/repository/album_repository.dart';

class AlbumsRepositoryImpl extends AlbumRepository {
  final AlbumDataSource albumDataSource;
  late final NetworkInfo networkInfo;

  AlbumsRepositoryImpl(
      {required this.networkInfo, required this.albumDataSource})
      : super(networkInfo);

  @override
  Future<Either<FailureModel, List<AlbumModel>>> fetchAlbumList(
          String? albumSearch) =>
      baseApiMethod(() => fetchAlbumListApiCall(albumSearch));

  Future<Either<FailureModel, List<AlbumModel>>> fetchAlbumListApiCall(
      String? albumSearch) async {
    List<AlbumModel> response =
        await albumDataSource.fetchAlbumList(albumSearch);
    return Right(response);
  }

  @override
  Future<Either<FailureModel, List<AlbumPhotoModel>>> fetchAlbumPhotos(
          int albumId) =>
      baseApiMethod(() => fetchAlbumPhotosApiCall(albumId));

  Future<Either<FailureModel, List<AlbumPhotoModel>>> fetchAlbumPhotosApiCall(
      int albumId) async {

    List<AlbumPhotoModel> response =
        await albumDataSource.fetchAlbumPhotos(albumId);

    print("AlbumTesting :: repo  :: photos fetched $response");
    return Right(response);
  }
}
