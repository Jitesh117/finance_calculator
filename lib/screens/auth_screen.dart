import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/auth_widgets/auth_screen_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Lottie.asset(
                'assets/animations/hero_animation.zip',
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              const AuthScreenButton(
                text: 'Register',
                buttonColor: Colors.greenAccent,
              ),
              const SizedBox(height: 20),
              const AuthScreenButton(
                text: 'Log in',
                buttonColor: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
