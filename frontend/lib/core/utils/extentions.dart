import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/screen_type.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isMobile => ScreenType.mobile == getScreenType(context: this);
  bool get isTablet => ScreenType.tablet == getScreenType(context: this);
  bool get isDeskTop=> ScreenType.desktop == getScreenType(context: this);
}