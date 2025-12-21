import 'package:books_app/core/utils/api_services.dart';
import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/core/utils/functions.dart';
import 'package:books_app/feature/home/data/models/book_model/book_model.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await ApiServices().getData(
      endpoint: 'Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    savedLocalData(books, boxName);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewBooks() async {
    var data = await ApiServices().getData(
      endpoint: 'Filtering=free-ebooks&Sorting=newest&q=programming',
    );
    List<BookEntity> newBooks = [];
    for (var item in data['items']) {
      newBooks.add(BookModel.fromJson(item));
    }
    savedLocalData(newBooks, newestBookBox);

    return newBooks;
  }
}
