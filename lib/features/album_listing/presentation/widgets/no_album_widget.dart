import 'package:flutter/material.dart';
import 'package:FlutterDemo/core/utils/app_constants.dart';

class NoAlbumWidget extends StatefulWidget {
  @override
  NoAlbumWidgetWidgetState createState() => NoAlbumWidgetWidgetState();
}

class NoAlbumWidgetWidgetState extends State<NoAlbumWidget> {
  @override
  Widget build(BuildContext context) => const Center(
        child: Text(LABEL_NO_ALBUM),
      );
}
