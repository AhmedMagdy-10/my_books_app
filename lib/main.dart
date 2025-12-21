import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async {
  runApp(const MyApp());

  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(boxName);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mainColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),

      home: SplashView(),
    );
  }
}
