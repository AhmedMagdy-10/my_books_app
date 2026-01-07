import 'package:books_app/core/utils/show_toast_state.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit_states.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_books_items.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListViewBlocBuilder extends StatefulWidget {
  const BooksListViewBlocBuilder({super.key});

  @override
  State<BooksListViewBlocBuilder> createState() =>
      _BooksListViewBlocBuilderState();
}

class _BooksListViewBlocBuilderState extends State<BooksListViewBlocBuilder> {
  List<BookEntity> allBooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksCubitStates>(
      listener: (context, state) {
        if (state is BooksSuccessState) {
          allBooks.addAll(state.books);
        }
        if (state is BooksPaginationFailureState) {
          return showToast(text: 'Pagination Error', state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is BooksSuccessState ||
            state is BooksPaginationLoadingState) {
          return CustomListViewBooksItems(listHeight: 0.3, books: allBooks);
        } else if (state is BooksFailureState) {
          return Text(state.errorMassege);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
