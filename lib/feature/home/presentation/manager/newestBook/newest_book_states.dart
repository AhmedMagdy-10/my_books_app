import 'package:books_app/feature/home/domain/entities/book_entity.dart';

abstract class NewestBooksCubitStates {}

// Newest Books States

class NewestBooksInitialState extends NewestBooksCubitStates {}

class NewestBooksLoadingState extends NewestBooksCubitStates {}

class NewestBooksSuccessState extends NewestBooksCubitStates {
  final List<BookEntity> books;
  NewestBooksSuccessState({required this.books});
}

class NewestBooksFailureState extends NewestBooksCubitStates {
  final String errorMassege;
  NewestBooksFailureState({required this.errorMassege});
}

class NewestBooksPaginationLoadingState extends NewestBooksCubitStates {}

class NewestBooksPaginationFailureState extends NewestBooksCubitStates {
  final String errorMassege;
  NewestBooksPaginationFailureState({required this.errorMassege});
}
