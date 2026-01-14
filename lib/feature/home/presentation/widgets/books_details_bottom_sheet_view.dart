import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/presentation/widgets/book_datails_image.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_details_description.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_book_details_title.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_books_datails_rating_and_category.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_books_details_perview_button.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_books_items.dart';
import 'package:flutter/material.dart';

class BooksDetailsBottomSheetView extends StatelessWidget {
  const BooksDetailsBottomSheetView({
    super.key,
    required this.book,
    required this.relatedBooks,
  });
  final BookEntity book;
  final List<BookEntity> relatedBooks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBooksImage(bookImage: book.image!),

            BuildBooksRatingAndCategory(
              rating: book.rating!,
              reviews: book.ratingsCount!,
              category: book.category!,
            ),

            CustomBooksTitle(title: book.title),
            CustomBookDescription(bookDescription: book.description!),
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
              child: CustomListViewBooksItems(
                listHeight: 0.2,
                books: relatedBooks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
