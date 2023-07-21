import 'package:FlutterDemo/features/auth_check/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<AuthTypesEnum> checkIfUserLoggedIn();

  // Future<bool> isUserVerified();
}
