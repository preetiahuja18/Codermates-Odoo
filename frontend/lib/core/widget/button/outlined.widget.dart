import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class AxOutlinedButton extends StatelessWidget {
  
  final String? label;
  final Widget? child;
  final VoidCallback onPressed;

  const AxOutlinedButton({
    super.key,
    required this.label,
    this.child,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: AxButtonStyle.outlinedButtonStyle,
        padding: AxButtonStyle.innerPadding,
        alignment: Alignment.center,
        child: label != null 
        ? Text(label!,style: AxButtonStyle.outlinedTextStyle)
        : child ?? Text(
          "Click Me",
            style: AxButtonStyle.outlinedTextStyle
          ),
      )
    );
  }
}