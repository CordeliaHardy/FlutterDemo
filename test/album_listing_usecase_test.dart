// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:FlutterDemo/features/album_listing/domain/entity/AlbumModel.dart';
import 'package:FlutterDemo/features/album_listing/domain/usecases/album_listing_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/features/album_listing/domain/repository/album_repository.dart';

class MockPostRepository extends Mock implements AlbumRepository {}

void main() async {
  late AlbumListingUseCase albumListingUseCase;
  late MockPostRepository repository;
  setUp(() {
    repository = MockPostRepository();
    albumListingUseCase = AlbumListingUseCase(repository);
  });

  List<AlbumModel> listAlbums = [
    AlbumModel(id: 1, title: "test ALbum", userId: 1235),
    AlbumModel(id: 2, title: "test ALbum2", userId: 1236)
  ];

  test(
    'should get current weather detail from the repository',
    () async {
      // arrange
      when(repository.fetchAlbumList(""))
          .thenAnswer((_) async => Right(listAlbums));

      // act
      final result = await albumListingUseCase("");

      // assert
      expect(result, equals(Right(listAlbums)));
    },
  );
}
