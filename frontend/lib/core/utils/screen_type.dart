import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop 

}

ScreenType getScreenType({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return ScreenType.mobile;
  } else if (width < 1024) {
    return ScreenType.tablet;
  } else {
    return ScreenType.desktop;
  }
}
