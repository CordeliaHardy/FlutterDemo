// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:FlutterDemo/core/di/injection_container.dart' as di;
import 'package:FlutterDemo/core/utils/testing_key_app_constants.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_bloc.dart';
import 'package:FlutterDemo/features/album_listing/presentation/bloc/albums_state.dart';
import 'package:FlutterDemo/features/album_listing/presentation/photosListing/AlbumPhotosListnPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FlutterDemo/features/album_listing/presentation/AlbumListnPage.dart';

void main() async {
  await di.initInjectionContainer(false);
  testWidgets('Album Listing Page Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AlbumListingPage(),
          themeMode: ThemeMode.system,
        );
      },
    ));
    final scafoldFinder = find.byType(Scaffold);
    expect(scafoldFinder, findsOneWidget);
    final safeAreaFinder = find.byType(SafeArea);
    expect(safeAreaFinder, safeAreaFinder);
    final providerFinder = find.byType(BlocProvider<AlbumListingBloc>);
    expect(providerFinder, findsOneWidget);
    // find blocBuilder in screen page
    final blocBuilderFinder =
        find.byType(BlocBuilder<AlbumListingBloc, AlbumsState>);
    expect(blocBuilderFinder, findsOneWidget);
    final columnFinder = find.byType(Column);
    expect(columnFinder, findsOneWidget);
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);
    await tester.drag(find.byKey(const Key(ALBUM_LISTING_LISTVIEW_PROVIDER)),
        const Offset(0.0, 300));
    await tester.pump();
    await tester.pumpAndSettle();
  });

  testWidgets('Album PhotosListing Page Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AlbumPhotosListnPage(albumId: 1),
          themeMode: ThemeMode.system,
        );
      },
    ));
    final scafoldFinder = find.byType(Scaffold);
    expect(scafoldFinder, findsOneWidget);
    final safeAreaFinder = find.byType(SafeArea);
    expect(safeAreaFinder, safeAreaFinder);
    final providerFinder = find.byType(BlocProvider<AlbumListingBloc>);
    expect(providerFinder, findsOneWidget);
    // find blocBuilder in screen page
    final blocBuilderFinder =
    find.byType(BlocBuilder<AlbumListingBloc, AlbumsState>);
    expect(blocBuilderFinder, findsOneWidget);
    await tester.pumpAndSettle();
  });
}
