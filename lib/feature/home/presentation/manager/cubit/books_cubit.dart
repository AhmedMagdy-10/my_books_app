import 'package:books_app/feature/home/domain/UseCase/get_main_books_use_case.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksCubitStates> {
  BooksCubit({required this.getMainBooksUseCase}) : super(BooksInitialState());

  final GetMainBooksUseCase getMainBooksUseCase;

  // Separate lists for each book type
  List<BookEntity> mainBooks = [];

  // Track loading states
  bool isLoadingMainBooks = false;

  Future<void> getMainBooks({int pageNamber = 0}) async {
    if (isLoadingMainBooks) return; // Prevent multiple calls

    if (pageNamber == 0) {
      emit(BooksLoadingState());
      mainBooks.clear(); // Clear on refresh
    } else {
      isLoadingMainBooks = true;
      emit(BooksPaginationLoadingState());
    }

    var results = await getMainBooksUseCase.call(pageNamber);

    results.fold(
      (failure) {
        isLoadingMainBooks = false;
        if (pageNamber == 0) {
          emit(BooksFailureState(errorMassege: failure.errorMessage));
        } else {
          emit(BooksPaginationFailureState(errorMassege: failure.errorMessage));
        }
      },
      (books) {
        isLoadingMainBooks = false;
        mainBooks.addAll(books);
        emit(BooksSuccessState(books: List.from(mainBooks)));
      },
    );
  }
}
