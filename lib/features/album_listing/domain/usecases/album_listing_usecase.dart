import 'package:dartz/dartz.dart';
import 'package:FlutterDemo/core/data/commons/models/FailureModel.dart';
import 'package:FlutterDemo/core/domain/commons/usecases/usecase.dart';
import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/repository/album_repository.dart';

class AlbumListingUseCase extends UseCase<List<AlbumModel>, String?> {
  late final AlbumRepository albumRepository;

  AlbumListingUseCase(this.albumRepository);

  @override
  Future<Either<FailureModel, List<AlbumModel>>> call(String? albumTitle) =>
      albumRepository.fetchAlbumList(albumTitle);
}
