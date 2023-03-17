abstract class AlbumEvents {}

class DiscussionsDetailsInitialEvent extends AlbumEvents {}

class FetchAlbumsEvent extends AlbumEvents {
  String albumSearchText;

  FetchAlbumsEvent(this.albumSearchText);
}

class FetchAlbumPhotosEvent extends AlbumEvents {
  int albumId;

  FetchAlbumPhotosEvent(this.albumId);
}
