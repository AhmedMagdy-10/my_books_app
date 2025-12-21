import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getCachedFeaturedBooks();
  List<BookEntity> getCachedNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> getCachedFeaturedBooks() {
    var box = Hive.box<BookEntity>(boxName);
    return box.values.toList();
  }

  @override
  List<BookEntity> getCachedNewestBooks() {
    var box = Hive.box<BookEntity>(newestBookBox);
    return box.values.toList();
  }
}
