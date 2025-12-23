import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

void savedLocalData(List<BookEntity> books, String booksName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}

abstract class UseCase<type> {
  Future<Either<Failure, type>> call();
}
