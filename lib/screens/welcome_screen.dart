import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/widgets/rounded_button_widget.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "/welcome_screen";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 1.0,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(animationController);

    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // To stop the animation when there is no screen
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Container(
                      height: 60.0, // animation.value * 100
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  AnimatedTextKit(
                    // repeatForever: true,
                    totalRepeatCount: 3,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Flash Chat",
                        speed: const Duration(milliseconds: 300),
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
              RoundedButtonWidget(
                title: "Log in",
                colour: Colors.lightBlueAccent,
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              ),
              RoundedButtonWidget(
                title: "Register",
                colour: Colors.blueAccent,
                onPressed: () => Navigator.pushNamed(context, RegistrationScreen.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
