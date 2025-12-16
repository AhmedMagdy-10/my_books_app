import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/presentation/widgets/book_datails_image.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_details_description.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_details_title.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_books_datails_rating_and_category.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_books_items.dart';
import 'package:flutter/material.dart';

class BooksDetailsBottomSheetView extends StatelessWidget {
  const BooksDetailsBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBooksImage(),

            BuildBooksRatingAndCategory(),

            CustomBooksTitle(),
            CustomBookDescription(),
            CustomBuyBookButtonAction(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'you can see also',
                textAlign: TextAlign.left,
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                  fontFamily: '',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomListViewBooksItems(listHeight: 0.2),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBuyBookButtonAction extends StatelessWidget {
  const CustomBuyBookButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),

              child: Text(
                '\$16.99',
                textAlign: TextAlign.center,
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Text(
                'perview free',
                textAlign: TextAlign.center,
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
