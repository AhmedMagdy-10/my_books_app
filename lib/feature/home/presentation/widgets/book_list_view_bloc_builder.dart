import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit_states.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_books_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListViewBlocBuilder extends StatelessWidget {
  const BooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksCubitStates>(
      builder: (context, state) {
        if (state is BooksSuccessState) {
          return CustomListViewBooksItems(listHeight: 0.3, books: state.books);
        } else if (state is BooksFailureState) {
          return Text(state.errorMassege);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
