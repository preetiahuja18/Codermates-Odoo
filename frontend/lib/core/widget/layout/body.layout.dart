import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  
  final Widget body;

  const BodyLayout({super.key,required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Skill Swap"
        ),
      ),
      body: body,
    );
  }
}