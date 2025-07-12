import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class BodyLayout extends StatelessWidget {
  
  final Widget body;
  final bool showAppBar;

   const BodyLayout({
    super.key,
    required this.body,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: showAppBar
      ? AppBar(
          backgroundColor: AxStyle.primaryBgColor,
          title: Text(
            "Skill Swap",
            style: AxStyle.primaryTextStyle,
          ),
        )
      : null,
      
      body: body,
    );
  }
}