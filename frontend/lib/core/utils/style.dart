import 'package:flutter/cupertino.dart';

abstract class AxStyle {

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);

  
  static const Color primaryBgColor = AxStyle.white;
  static const Color primaryTextColor = AxStyle.black;

  static const TextStyle primaryTextStyle = TextStyle(
    color: primaryTextColor
  );
  
  static const Color secondaryBgColor = AxStyle.white;
  static const Color secondaryTextColor = AxStyle.black;

  static const TextStyle secondaryTextStyle = TextStyle(
    color: secondaryTextColor
  );

}



abstract class AxButtonStyle {


  static final BorderRadius borderRadius =  BorderRadius.circular(12.0);
  static const EdgeInsets innerPadding =  EdgeInsets.all(12.0);

  static const Color filledBgColor = AxStyle.primaryBgColor;
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



}