// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:FlutterDemo/core/di/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:FlutterDemo/core/utils/testing_key_app_constants.dart';
import 'package:FlutterDemo/features/album_listing/presentation/AlbumListnPage.dart';

import 'package:FlutterDemo/features/album_listing/presentation/AlbumListnPage.dart';

void main() async {
  await di.initInjectionContainer(false);
  testWidgets('Album Listing Page Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: AlbumListingPage()));

    final scafoldFinder = find.byKey(const Key(ALBUM_LISTING_SCAFFOLD));

    expect(scafoldFinder, findsOneWidget);

    final providerFinder = find.byKey(const Key(ALBUM_LISTING_PROVIDER));

    expect(providerFinder, findsOneWidget);
    await tester.pumpAndSettle();
  });
}
