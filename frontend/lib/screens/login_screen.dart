import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/utils/extentions.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/components/input.dart';
import 'package:skill_swap/core/widget/layout/body.layout.dart';
import 'package:skill_swap/modules/home/view.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();

  bool isRegisterMode = false;
  bool isLoading = false;

  Future<void> handleSubmit() async {
    setState(() => isLoading = true);

    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    final username = usernameCtrl.text.trim();
    final auth = Provider.of<AuthProvider>(context, listen: false);

    if (!isRegisterMode) {
      final success = await auth.login(email, password);
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Home()),
        );
      } else {
        setState(() => isRegisterMode = true); // fallback to registrationz
      }
    } else {
      final registered = await auth.register(username, email, password);
      if (registered) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Home()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Registration Failed")));
      }
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isMobile
                ? [Colors.blue.shade700, Colors.blueAccent]
                : [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Animate(
              effects: const [FadeEffect(), ScaleEffect()],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "SkillSwap",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 40),
                  Animate(
                    effects: const [
                      FadeEffect(delay: Duration(milliseconds: 300)),
                      SlideEffect(),
                    ],
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      width: context.isDeskTop ? 500 : double.infinity,
                      decoration: AxStyle.cardDecoration,
    
                      child: Column(
                        children: [
                          if (isRegisterMode)
                            InputField(
                              controller: usernameCtrl,
                              hintText: "Username",
                              icon: Icons.person_outline,
                            ),
                          const SizedBox(height: 16),
                          InputField(
                            controller: emailCtrl,
                            hintText: "Email",
                            icon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            controller: passwordCtrl,
                            hintText: "Password",
                            icon: Icons.lock_outline,
                            obscureText: true,
                          ),
                          const SizedBox(height: 24),
                          AxFilledButton(
                            label: isLoading
                                ? "Please wait..."
                                : isRegisterMode
                                ? "Register"
                                : "Login",
                            onPressed: isLoading ? () {} : handleSubmit,
                          ).animate().fadeIn(delay: 600.ms).scale(),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot your password?",
                              style: AxStyle.secondaryTextStyle,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isRegisterMode = !isRegisterMode;
                              });
                            },
                            child: Text(
                              isRegisterMode
                                  ? "Back to Login"
                                  : "Don’t have an account? Register",
                              style:AxStyle.secondaryTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
