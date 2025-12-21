import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final String? category;
  @HiveField(6)
  final num? rating;
  @HiveField(7)
  final num? ratingsCount;

  BookEntity({
    required this.bookId,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
    required this.ratingsCount,
  });
}
