abstract class IRemoteDataSource {
  Future<dynamic> executeGet(
    String path,
  );
}
