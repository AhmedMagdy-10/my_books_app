class BookEntity {
  final String bookId;
  final String title;
  final String? author;
  final String? description;
  final String? image;
  final String? category;
  final num? rating;
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
