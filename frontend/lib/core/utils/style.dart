import 'package:flutter/material.dart';

abstract class AxStyle {

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);


  static final Color primaryBgColor = Colors.blue.shade700;
  static const Color primaryTextColor = AxStyle.white;

  static const TextStyle primaryTextStyle = TextStyle(
    color: primaryTextColor
  );
  
  static const Color secondaryBgColor = AxStyle.white;
  static const Color secondaryTextColor = AxStyle.black;

  static const TextStyle secondaryTextStyle = TextStyle(
    color: secondaryTextColor
  );

  static final BoxDecoration cardDecoration = BoxDecoration(
    color: AxStyle.secondaryBgColor.withValues(alpha: 0.8),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: AxStyle.secondaryBgColor.withValues(alpha: 0.3),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 30,
        offset: const Offset(0, 6),
      ),
    ],
  );

}




abstract class AxButtonStyle {


  static final BorderRadius borderRadius =  BorderRadius.circular(12.0);
  static const EdgeInsets innerPadding =  EdgeInsets.all(12.0);

  static final Color filledBgColor = AxStyle.primaryBgColor;
  static const Color filledTextColor = AxStyle.primaryTextColor;

  static final BoxDecoration filled =  BoxDecoration(
  color: AxButtonStyle.filledBgColor,
    borderRadius: borderRadius
  );


  static const TextStyle filledTextStyle = AxStyle.primaryTextStyle;

  static const Color outlinedBgColor = AxStyle.secondaryBgColor;
  static const Color outlinedBoderColor = AxStyle.secondaryTextColor;
  static const Color outlinedTextColor = AxStyle.secondaryTextColor;

  static const TextStyle outlinedTextStyle = AxStyle.secondaryTextStyle;

  static final BoxDecoration outlinedButtonStyle =  BoxDecoration(
    color: AxButtonStyle.outlinedBgColor,
    border: Border.all(color: AxButtonStyle.outlinedBoderColor),
    borderRadius: borderRadius
  );



  static final InputBorder enableInputBorder  = OutlineInputBorder(
    borderRadius: AxButtonStyle.borderRadius,
    borderSide: BorderSide(color: outlinedBoderColor.withValues(alpha: 0.3)),
  );

  static final InputBorder focusedInputBorder  = OutlineInputBorder(
    borderRadius: AxButtonStyle.borderRadius,

    borderSide: BorderSide(color: outlinedBoderColor.withValues(alpha: 0.3)),
  );
}