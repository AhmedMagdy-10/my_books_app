import 'package:books_app/feature/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getCachedFeaturedBooks();
  List<BookEntity> getCachedNewestBooks();
}
