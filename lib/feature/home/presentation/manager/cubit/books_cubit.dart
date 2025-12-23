import 'package:books_app/feature/home/domain/UseCase/get_main_books_use_case.dart';
import 'package:books_app/feature/home/domain/UseCase/get_newest_books_use_case.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksCubitStates> {
  BooksCubit({
    required this.getMainBooksUseCase,
    required this.getNewestBooksUseCase,
  }) : super(BooksInitialState());

  final GetMainBooksUseCase getMainBooksUseCase;
  final GetNewestBooksUseCase getNewestBooksUseCase;
  Future<void> getMainBooks() async {
    emit(BooksLoadingState());
    var results = await getMainBooksUseCase.call();
    results.fold(
      ((failure) =>
          emit(BooksFailureState(errorMassege: failure.errorMessage))),
      ((books) => emit(BooksSuccessState(books: books))),
    );
  }

  Future<void> getNewestBooks() async {
    emit(BooksLoadingState());
    var results = await getNewestBooksUseCase.call();
    results.fold(
      ((failure) =>
          emit(BooksFailureState(errorMassege: failure.errorMessage))),
      ((books) => emit(BooksSuccessState(books: books))),
    );
  }
}
