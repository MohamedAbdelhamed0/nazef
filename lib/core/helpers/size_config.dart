import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    screenHeight = size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }

  static double getResponsiveSize(double size) {
    if (screenWidth! < 360) {
      return blockSizeHorizontal! * (size / 1.5);
    } else if (screenWidth! < 600) {
      return blockSizeHorizontal! * (size / 2.0);
    } else if (screenWidth! < 1024) {
      return blockSizeHorizontal! * (size / 3.5);
    } else {
      return blockSizeHorizontal! * (size / 4.0);
    }
  }
}
