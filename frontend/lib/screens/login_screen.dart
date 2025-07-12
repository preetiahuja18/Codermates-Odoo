import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/widget/components/input.dart';
import 'package:skill_swap/core/widget/components/primary_button.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';

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

  void handleSubmit() async {
    setState(() => isLoading = true);
    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    final username = usernameCtrl.text.trim();
    final auth = Provider.of<AuthProvider>(context, listen: false);

    if (!isRegisterMode) {
      final success = await auth.login(email, password);
      if (success) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        setState(() => isRegisterMode = true);
      }
    } else {
      final registered = await auth.register(username, email, password);
      if (registered) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration Failed")));
      }
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,
      // elevation:0,
      // title:Text(isRegisterMode ? "Register" : "Login", 
      // style: const TextStyle(
      //   fontWeight: FontWeight.bold,
      //   fontSize: 22,
      //   color: Colors.white,
      // ),),
      // centerTitle: true,),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F51B5), Color(0xFF2196F3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: const Text(
                    "SkillSwap",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Animate(
                  effects: const [FadeEffect(delay: Duration(milliseconds: 300)), SlideEffect()],
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 30,
                          offset: const Offset(0, 6),
                        )
                      ],
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
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
                        PrimaryButton(
                          text: isLoading
                              ? "Please wait..."
                              : isRegisterMode
                                  ? "Register"
                                  : "Login",
                          onPressed: isLoading ? null : handleSubmit,
                        ).animate().fadeIn(delay: 600.ms).scale(),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to Forgot Password
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(color: Colors.white),
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
                            style: const TextStyle(
                              color: Colors.white,
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
    );
  }
}
