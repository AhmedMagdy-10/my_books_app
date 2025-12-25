import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/feature/home/data/data_source/home_local_data_source.dart';
import 'package:books_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNamber = 0,
  }) async {
    try {
      var localDate = homeLocalDataSource.getCachedFeaturedBooks(
        pageNamber: pageNamber,
      );
      if (localDate.isNotEmpty) {
        return right(localDate);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNamber: pageNamber,
      );

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var localDate = homeLocalDataSource.getCachedNewestBooks();
      if (localDate.isNotEmpty) {
        return right(localDate);
      }
      var books = await homeRemoteDataSource.fetchNewBooks();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
