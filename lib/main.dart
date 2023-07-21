import 'package:FlutterDemo/features/auth_check/auth_repository.dart';
import 'package:FlutterDemo/features/auth_check/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FlutterDemo/features/splash/presentation/widget/splash_screen_widget.dart';

import 'package:FlutterDemo/core/di/injection_container.dart' as di;

void main() async {
  await di.initInjectionContainer(false);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

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

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        AuthRepository authRepository = di.sl();
        AuthTypesEnum authType = await authRepository.checkIfUserLoggedIn();
        // authType == DEVICESUPPORTED{
        //
        // }

        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}
