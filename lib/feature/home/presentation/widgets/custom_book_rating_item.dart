import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRatingItem extends StatelessWidget {
  const BookRatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Color(0xffFFDD4F), size: 20),
        SizedBox(width: 6),
        Text(
          '4.8',
          style: Styles.textStyle16.copyWith(
            color: Colors.amber.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),

        Text(' (200k)', style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
