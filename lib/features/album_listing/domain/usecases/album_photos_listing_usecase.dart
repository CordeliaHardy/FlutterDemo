import 'package:dartz/dartz.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/core/domain/commons/usecases/usecase.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumPhotoModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/repository/album_repository.dart';

class AlbumPhotosUseCase extends UseCase<List<AlbumPhotoModel>, int> {
  late final AlbumRepository albumRepository;

  AlbumPhotosUseCase(this.albumRepository);

  @override
  Future<Either<FailureModel, List<AlbumPhotoModel>>> call(int albumID) =>
      albumRepository.fetchAlbumPhotos(albumID);
}
