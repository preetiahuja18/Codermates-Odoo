import 'package:flutter/material.dart';
import 'package:skill_swap/core/utils/style.dart';

class BodyLayout extends StatelessWidget {
  
  final Widget body;
  final Widget? bottomWidget;
  final bool showAppBar;

   const BodyLayout({
    super.key,
    required this.body,
    this.showAppBar = true,
    this.bottomWidget
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: showAppBar
      ? AppBar(
        foregroundColor: AxStyle.primaryTextColor,
          backgroundColor: AxStyle.primaryBgColor,
          title: Text(
            "Skill Swap",
            style: AxStyle.primaryTextStyle,
          ),
        )
      : null,
      bottomNavigationBar: bottomWidget != null 
        ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              bottomWidget!,
            ],
          ),
        )
        : null,
      body: body,
    );
    
  }
}