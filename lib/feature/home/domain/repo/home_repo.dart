import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNamber = 0,
  });
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    int pageNamber = 0,
  });
}
