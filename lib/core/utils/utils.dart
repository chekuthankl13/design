import 'package:flutter/material.dart';

spaceHeight(height) => SizedBox(height: double.parse(height.toString()));

spaceWidth(width) => SizedBox(width: double.parse(width.toString()));

sH(context) => MediaQuery.of(context).size.height;

sW(context) => MediaQuery.of(context).size.width;

Center loading() {
  return const Center(
    child: CircularProgressIndicator(
        color: Colors.blue,
        ),
  );
}



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
