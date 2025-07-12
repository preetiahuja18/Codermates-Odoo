import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/utils/extentions.dart';
import 'package:skill_swap/core/utils/navigation.dart';
import 'package:skill_swap/core/utils/style.dart';
import 'package:skill_swap/core/widget/button/filled.widget.dart';
import 'package:skill_swap/core/widget/components/input.dart';
import 'package:skill_swap/providers/auth_provider.dart';
import 'package:skill_swap/screens/login_screen.dart';
import 'package:skill_swap/screens/user_profile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();

  bool isLoading = false;

  Future<void> handleRegister() async {
    setState(() => isLoading = true);

    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    final username = usernameCtrl.text.trim();

    final auth = Provider.of<AuthProvider>(context, listen: false);
    final success = await auth.register(username, email, password);

    if (success) {
      naviagteTo(context: context, widget: const UserProfileScreen());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Failed")));
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
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.1,
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
                            label: isLoading ? "Please wait..." : "Register",
                            onPressed: isLoading ? () {} : handleRegister,
                          ).animate().fadeIn(delay: 600.ms).scale(),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Already have an account? Login",
                              style: AxStyle.secondaryTextStyle,
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
