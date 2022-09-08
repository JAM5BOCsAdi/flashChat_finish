import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String? title;
  final Color? colour;
  final VoidCallback onPressed;
  const RoundedButtonWidget({Key? key, this.title, this.colour, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          elevation: 5.0,
          primary: colour, // Colors.lightBlueAccent
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          "$title",
          style: const TextStyle(
            color: Colors.white,
          ), // 'Log in'
        ),
      ),
    );
  }
}
