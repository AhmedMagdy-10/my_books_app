import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/presentation/widgets/book_datails_image.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_rating_item.dart';
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

class CustomBookDescription extends StatelessWidget {
  const CustomBookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description : ',
            style: Styles.textStyle16.copyWith(
              color: Colors.black87,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 12),
          Text(
            'goes here. This is a placeholder for the book description. It provides an overview of the book content, themes, and other relevant information that might interest potential readers.',
            style: Styles.textStyle14.copyWith(
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBooksTitle extends StatelessWidget {
  const CustomBooksTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Harry Potter and the Goblet of Fire Fire  ',
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
