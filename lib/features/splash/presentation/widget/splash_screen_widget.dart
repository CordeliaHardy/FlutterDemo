import 'package:FlutterDemo/core/di/injection_container.dart';
import 'package:FlutterDemo/features/auth_check/auth_repository.dart';
import 'package:FlutterDemo/features/auth_check/auth_repository_impl.dart';
import 'package:FlutterDemo/features/auth_check/loggedInUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/core/colors/app_colors.dart';
import 'package:FlutterDemo/core/utils/app_constants.dart';

class SplashScreenWidget extends StatefulWidget {
  SplashScreenWidget({Key? key});

  @override
  State<StatefulWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 700)).then((value) async {
    //   AuthRepository authRepository = sl();
    //   AuthTypesEnum authType = await authRepository.checkIfUserLoggedIn();
    //    switch(authType){
    //      case AuthTypesEnum.USERALLOWED:
    //        Navigator.pushReplacement(
    //          context,
    //          MaterialPageRoute(
    //            builder: (BuildContext context) => UserLoggedInView(),
    //          ),
    //        );
    //        break;
    //      case AuthTypesEnum.USERNOTVERIFIED:
    //        Navigator.pushReplacement(
    //          context,
    //          MaterialPageRoute(
    //            builder: (BuildContext context) => UserLoggedInView(),
    //          ),
    //        );
    //        break;
    //
    //    }
    // });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.splashBackground,
        body: Column(children: [
          Text('Hardy'),

          Text('Hardy'),

          Text('Hardy'),

          Text('Hardy'),

        ],mainAxisAlignment: MainAxisAlignment.end,),
      );
}
