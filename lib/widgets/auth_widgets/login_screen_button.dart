import 'package:flutter/material.dart';

class LoginScreenButton extends StatelessWidget {
  const LoginScreenButton({
    super.key,
    required this.buttonColor,
    required this.imagePath,
  });

  final Color buttonColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: buttonColor,
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
      child: Image.asset(
        imagePath,
        height: 50,
        width: 50,
      ),
    );
  }
}
