import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/features/splash/presentation/widget/splash_screen_widget.dart';

import 'package:FlutterDemo/core/di/injection_container.dart' as di;

void main() async {
  await di.initInjectionContainer(false);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenWidget(),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
