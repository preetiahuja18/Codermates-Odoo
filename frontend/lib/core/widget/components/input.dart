import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AxStyle.primaryTextStyle.copyWith(color: AxStyle.white),
      cursorColor: AxStyle.white,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: AxStyle.white.withValues(alpha: 0.7))
            : null,
        hintText: hintText,
        hintStyle: AxStyle.primaryTextStyle.copyWith(
          color: AxStyle.white.withValues(alpha: 0.7),
        ),
        filled: true,
        fillColor: AxStyle.white.withValues(alpha: 0.12),
        contentPadding: AxButtonStyle.innerPadding,
        enabledBorder: OutlineInputBorder(
          borderRadius: AxButtonStyle.borderRadius,
          borderSide: BorderSide(color: AxStyle.white.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AxButtonStyle.borderRadius,
          borderSide: BorderSide(color: AxStyle.white, width: 1.5),
        ),
      ),
    );
  }
}
