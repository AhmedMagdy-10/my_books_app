import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart'
    show BookEntity;
import 'package:books_app/feature/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetMainBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  GetMainBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchFeaturedBooks();
  }
}

abstract class UseCase<type> {
  Future<Either<Failure, type>> call();
}
