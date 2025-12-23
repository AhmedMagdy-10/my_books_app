import 'package:books_app/feature/home/domain/UseCase/get_main_books_use_case.dart';
import 'package:books_app/feature/presentation/manager/cubit/books_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksCubitStates> {
  BooksCubit(this.getMainBooksUseCase) : super(BooksInitialState());

  final GetMainBooksUseCase getMainBooksUseCase;

  Future<void> getMainBooks() async {
    emit(BooksLoadingState());
    var results = await getMainBooksUseCase.call();
    results.fold(
      ((failure) =>
          emit(BooksFailureState(errorMassege: failure.errorMessage))),
      ((books) => emit(BooksSuccessState(books: books))),
    );
  }
}
