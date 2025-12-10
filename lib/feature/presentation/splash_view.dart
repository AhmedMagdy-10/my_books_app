import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/presentation/widgets/splash_view_boody.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: mainColor, body: SplashViewBoody());
  }
}
