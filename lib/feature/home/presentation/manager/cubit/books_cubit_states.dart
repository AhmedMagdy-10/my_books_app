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

class NewestBooksLoadingState extends BooksCubitStates {}

class NewestBooksPaginationLoadingState extends BooksCubitStates {}

class NewestBooksPaginationFailureState extends BooksCubitStates {
  final String errorMassege;

  NewestBooksPaginationFailureState({required this.errorMassege});
}

class NewestBooksSuccessState extends BooksCubitStates {
  final List<BookEntity> books;

  NewestBooksSuccessState({required this.books});
}

class NewestBooksFailureState extends BooksCubitStates {
  final String errorMassege;

  NewestBooksFailureState({required this.errorMassege});
}
