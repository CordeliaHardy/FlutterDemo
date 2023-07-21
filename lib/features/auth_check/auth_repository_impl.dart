import 'package:FlutterDemo/features/auth_check/auth_repository.dart';
import 'package:FlutterDemo/features/auth_check/message_constants.dart';
import 'package:FlutterDemo/features/auth_check/prefs_constants.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthrepositoryImpl extends AuthRepository {
  @override
  Future<AuthTypesEnum> checkIfUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUserLoggedIn = prefs.getBool(PRFEFS_USER_LOGGED_IN)!;
    if (!isUserLoggedIn) {
      return AuthTypesEnum.USERALLOWED;
    } else {
      final LocalAuthentication auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();

      if (!canAuthenticate) {
        return AuthTypesEnum.DEVICESUPPORTED;
      } else {
        bool isAuthenticated = false;
        try {
          final bool didAuthenticate = await auth.authenticate(
              localizedReason: PLEASE_AUTHENTICATE_YOUR_APP);
          isAuthenticated = didAuthenticate;
        } catch (e) {
          return AuthTypesEnum.USERNOTVERIFIED;
        }
        if (isAuthenticated) {
          return AuthTypesEnum.USERALLOWED;
        } else {
          return AuthTypesEnum.USERNOTVERIFIED;
        }
      }
    }
  }
//
// @override
// Future<bool> isUserVerified() async {
//   bool isAuthenticated = false;
//   final LocalAuthentication auth = LocalAuthentication();
//   final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
//   final bool canAuthenticate =
//       canAuthenticateWithBiometrics || await auth.isDeviceSupported();
//   if (canAuthenticate) {
//     try {
//       final bool didAuthenticate = await auth.authenticate(
//           localizedReason: PLEASE_AUTHENTICATE_YOUR_APP);
//       isAuthenticated = didAuthenticate;
//     } catch (e) {
//       return isAuthenticated;
//     }
//     return isAuthenticated;
//   } else {
//     return isAuthenticated;
//   }
// }
//
// @override
// Future<bool> isDeviceSupported() async {
//   final LocalAuthentication auth = LocalAuthentication();
//   final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
//   final bool canAuthenticate =
//       canAuthenticateWithBiometrics || await auth.isDeviceSupported();
//   return canAuthenticate;
// }
}

enum AuthTypesEnum { USERALLOWED, DEVICESUPPORTED, USERNOTVERIFIED }
