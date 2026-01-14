import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/core/utils/functions.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  GetNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNamber = 0]) async {
    return await homeRepo.fetchNewestBooks(pageNamber: pageNamber);
  }
}
