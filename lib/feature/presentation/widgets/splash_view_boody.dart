import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashViewBoody extends StatefulWidget {
  const SplashViewBoody({super.key});

  @override
  State<SplashViewBoody> createState() => _SplashViewBoodyState();
}

late AnimationController animatedController;
late Animation<Offset> textAnimation;

class _SplashViewBoodyState extends State<SplashViewBoody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    textAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(animatedController);
    animatedController.forward();
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: mainColor,
      duration: 3000,
      nextScreen: HomeScreen(),
      centered: true,
      splashIconSize: 300,
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(child: Lottie.asset('assets/images/Book Idea.json')),
          SizedBox(height: 20),
          AnimatedBuilder(
            builder: (context, d) {
              return SlideTransition(
                position: textAnimation,
                child: Text(
                  'Islamic Books laibrary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            },
            animation: textAnimation,
          ),
        ],
      ),
    );
  }
}
