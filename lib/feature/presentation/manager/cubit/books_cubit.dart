import 'package:books_app/feature/presentation/manager/cubit/books_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksCubitStates> {
  BooksCubit() : super(BooksInitialState());
}
