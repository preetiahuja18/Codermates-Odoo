import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final int maxLine;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.icon,
    this.maxLine =1
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AxStyle.secondaryTextStyle,
      cursorColor: Colors.white,
      maxLines: maxLine,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: AxStyle.secondaryTextColor.withValues(alpha: 0.7))
            : null,
        hintText: hintText,
        hintStyle: AxStyle.secondaryTextStyle,
        filled: true,
        fillColor: AxStyle.secondaryBgColor.withValues(alpha: 0.12),
        contentPadding: AxButtonStyle.innerPadding,
        enabledBorder: AxButtonStyle.enableInputBorder,
        focusedBorder: AxButtonStyle.focusedInputBorder,
    
    
      ),
    );
  }
}
