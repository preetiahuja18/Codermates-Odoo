import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class BodyLayout extends StatelessWidget {
  
  final Widget body;

  const BodyLayout({super.key,required this.body});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: AxStyle.primaryBgColor,
        title: Text(
          "Skill Swap",
          style: AxStyle.primaryTextStyle,
        ),
      ),
      body: body,
    );
  }
}