import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/modules/home/view.dart';
import 'package:skill_swap/providers/auth_provider.dart';
import 'package:skill_swap/screens/login_screen.dart';

class SkilSwapApp extends StatelessWidget {
  const SkilSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'Skil Swap',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
