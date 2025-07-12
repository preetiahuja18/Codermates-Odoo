import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: AxButtonStyle.innerPadding,
        decoration: AxButtonStyle.filled,
        alignment: Alignment.center,
        child: Text(
          text,
          style: AxButtonStyle.filledTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
