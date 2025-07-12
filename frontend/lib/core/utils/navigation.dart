import 'package:flutter/cupertino.dart';

void naviagteTo({
  required BuildContext? context,
  required Widget? widget
  }) {
  if(context != null && widget != null) {
    Navigator.push(context, CupertinoPageRoute(builder: (_) {
      return widget;
    }));
  }
}