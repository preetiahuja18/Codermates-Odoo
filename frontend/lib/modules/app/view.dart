import 'package:flutter/material.dart';
import 'package:skill_swap/modules/home/view.dart';

class SkilSwapApp extends StatelessWidget {
  const SkilSwapApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Skil Swap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff4ba94f)),
      ),
      home: const Home(),
    );
  }
}