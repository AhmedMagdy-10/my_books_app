import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getCachedFeaturedBooks({int pageNamber = 0});
  List<BookEntity> getCachedNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> getCachedFeaturedBooks({int pageNamber = 0}) {
    int startIndex = pageNamber * 10;
    int endIndex = (pageNamber + 1) * 10;

    var box = Hive.box<BookEntity>(boxName);
    var length = box.values.length;
    if (startIndex >= length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> getCachedNewestBooks() {
    var box = Hive.box<BookEntity>(newestBookBox);
    return box.values.toList();
  }
}
