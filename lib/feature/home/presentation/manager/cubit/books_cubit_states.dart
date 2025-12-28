import 'package:books_app/feature/home/domain/entities/book_entity.dart';

abstract class BooksCubitStates {}

class BooksInitialState extends BooksCubitStates {}

class BooksLoadingState extends BooksCubitStates {}

class BooksPaginationLoadingState extends BooksCubitStates {}

class BooksPaginationFailureState extends BooksCubitStates {
  final String errorMassege;

  BooksPaginationFailureState({required this.errorMassege});
}

class BooksSuccessState extends BooksCubitStates {
  final List<BookEntity> books;

  BooksSuccessState({required this.books});
}

class BooksFailureState extends BooksCubitStates {
  final String errorMassege;

  BooksFailureState({required this.errorMassege});
}
