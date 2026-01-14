import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getCachedFeaturedBooks({int pageNamber = 0});
  List<BookEntity> getCachedNewestBooks({int pageNamber = 0});
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
  List<BookEntity> getCachedNewestBooks({int pageNamber = 0}) {
    int startIndex = pageNamber * 10;
    int endIndex = (pageNamber + 1) * 10;

    var box = Hive.box<BookEntity>(newestBookBox);
    var length = box.values.length;
    if (startIndex >= length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
