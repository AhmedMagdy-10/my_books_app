import 'package:books_app/feature/home/domain/UseCase/get_newest_books_use_case.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/presentation/manager/newestBook/newest_book_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksCubitStates> {
  NewestBooksCubit({required this.getNewestBooksUseCase})
    : super(NewestBooksInitialState());

  final GetNewestBooksUseCase getNewestBooksUseCase;
  List<BookEntity> newestBooks = [];

  bool isLoadingNewestBooks = false;

  Future<void> getNewestBooks({int pageNamber = 0}) async {
    if (isLoadingNewestBooks) return; // Prevent multiple calls

    if (pageNamber == 0) {
      emit(NewestBooksLoadingState());
      newestBooks.clear(); // Clear on refresh
    } else {
      isLoadingNewestBooks = true;
      emit(NewestBooksPaginationLoadingState());
    }

    var results = await getNewestBooksUseCase.call(pageNamber);

    results.fold(
      (failure) {
        isLoadingNewestBooks = false;
        if (pageNamber == 0) {
          emit(NewestBooksFailureState(errorMassege: failure.errorMessage));
        } else {
          emit(
            NewestBooksPaginationFailureState(
              errorMassege: failure.errorMessage,
            ),
          );
        }
      },
      (books) {
        isLoadingNewestBooks = false;
        newestBooks.addAll(books);
        emit(NewestBooksSuccessState(books: List.from(newestBooks)));
      },
    );
  }
}
