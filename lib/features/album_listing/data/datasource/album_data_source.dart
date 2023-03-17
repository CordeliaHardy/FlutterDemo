import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';

abstract class AlbumDataSource {
  Future<List<AlbumModel>> fetchAlbumList(String? albumSearch);

  Future<List<AlbumPhotoModel>> fetchAlbumPhotos(int albumId);
}
