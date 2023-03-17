import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxDecorationCustomWidget extends StatelessWidget {
  final Widget childWidget;

  BoxDecorationCustomWidget({Key? key, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          // to make elevation
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          // to make the coloured border
          BoxShadow(
            color: Colors.blue,
            offset: Offset(0, 4),
          ),
        ],
      ),
      height: 50,
      child: childWidget,
    );
  }
}
