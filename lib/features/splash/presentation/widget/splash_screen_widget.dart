import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/core/colors/app_colors.dart';
import 'package:FlutterDemo/core/utils/app_constants.dart';
import 'package:FlutterDemo/features/album_listing/presentation/AlbumListnPage.dart';

class SplashScreenWidget extends StatefulWidget {
  SplashScreenWidget({Key? key});

  @override
  State<StatefulWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => AlbumListingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.splashBackground,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 50.w, right: 50.w),
          child: Text(LABEL_WELCOME),
        ),
      );
}
