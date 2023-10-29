import 'package:flutter/material.dart';

class AuthScreenButton extends StatelessWidget {
  const AuthScreenButton({
    super.key,
    required this.buttonColor,
    required this.text,
  });

  final Color buttonColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.sizeOf(context).width - 32,
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
      child:  Text(
       text, 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
