import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_rating_item.dart';
import 'package:flutter/material.dart';

class BuildBooksRatingAndCategory extends StatelessWidget {
  const BuildBooksRatingAndCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,

              borderRadius: BorderRadius.circular(12),
            ),
            child: BookRatingItem(),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Book Category',
              style: Styles.textStyle14.copyWith(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
