import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chat',
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      // home: const WelcomeScreen(), Same as "initialRoute"
      initialRoute: const WelcomeScreen().id,
      routes: {
        const WelcomeScreen().id: (context) => const WelcomeScreen(),
        "/login_screen": (context) => const LoginScreen(),
        "/registration_screen": (context) => const RegistrationScreen(),
        "/chat_screen": (context) => const ChatScreen(),
      },
    );
  }
}
