import 'package:FlutterDemo/core/di/injection_container.dart';
import 'package:FlutterDemo/features/auth_check/auth_repository.dart';
import 'package:FlutterDemo/features/auth_check/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/core/colors/app_colors.dart';
import 'package:FlutterDemo/core/utils/app_constants.dart';

class UserNotVerified extends StatefulWidget {
  UserNotVerified({Key? key});

  @override
  State<StatefulWidget> createState() => _UserNotVerifiedState();
}

class _UserNotVerifiedState extends State<UserNotVerified> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.splashBackground,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 50.w, right: 50.w),
          child: const Text("UserNot Verified"),
        ),
      );
}
