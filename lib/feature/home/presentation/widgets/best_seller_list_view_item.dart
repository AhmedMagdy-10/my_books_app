import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_rating_item.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          ListViewBookItem(),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Harry Potter and the Goblet of Fire',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: Styles.textStyle20.copyWith(
                    fontFamily: 'GT Sectra Fine',
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'J.K. Rowling',
                  style: Styles.textStyle14.copyWith(color: Colors.white54),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      '\$16.99',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    BookRatingItem(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
