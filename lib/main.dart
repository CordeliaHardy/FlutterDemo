import 'package:FlutterDemo/features/videos_listing/presentation/VideoListingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
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
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: VideoListingPage(),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
