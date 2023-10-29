import 'package:fin_calc/widgets/auth_widgets/login_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Lottie.asset(
                'assets/animations/login.json',
                height: 300,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),
              LoginInputField(
                textController: emailController,
                kind: 'Email',
              ),
              const SizedBox(height: 20),
              LoginInputField(
                textController: passwordController,
                kind: 'Password',
              ),
              const SizedBox(height: 20),
              const Text(
                'Or Login using:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginScreenButton(
                    imagePath: 'assets/icons/google.png',
                    buttonColor: Colors.greenAccent,
                  ),
                  LoginScreenButton(
                    imagePath: 'assets/icons/apple.png',
                    buttonColor: Colors.blueAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginInputField extends StatelessWidget {
  const LoginInputField({
    super.key,
    required this.textController,
    required this.kind,
  });

  final TextEditingController textController;
  final String kind;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        controller: textController,
        keyboardType: kind == 'Email'
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return kind == 'Email' ? 'Enter email' : 'Enter password';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: kind == 'Email' ? 'Enter email' : 'Enter password',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
