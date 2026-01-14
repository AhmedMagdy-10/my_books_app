import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBooksTitle extends StatelessWidget {
  const CustomBooksTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,

        style: Styles.textStyle20.copyWith(
          fontFamily: 'GT Sectra Fine',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
