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
  Future<void> getMainBooks({int pageNamber = 0}) async {
    if (pageNamber == 0) {
      emit(BooksLoadingState());
    } else {
      emit(BooksPaginationLoadingState());
    }

    var results = await getMainBooksUseCase.call(pageNamber);
    results.fold(((failure) {
      if (pageNamber == 0) {
        emit(BooksFailureState(errorMassege: failure.errorMessage));
      } else {
        emit(BooksPaginationFailureState(errorMassege: failure.errorMessage));
      }
    }), ((books) => emit(BooksSuccessState(books: books))));
  }

  Future<void> getNewestBooks() async {
    emit(BooksLoadingState());
    var results = await getNewestBooksUseCase.call(0);
    results.fold(
      ((failure) =>
          emit(BooksFailureState(errorMassege: failure.errorMessage))),
      ((books) => emit(BooksSuccessState(books: books))),
    );
  }
}
