class BookEntity {
  final String id;
  final String title;
  final String author;
  final String description;
  final String image;
  final String category;
  final num rating;
  final num ratingsCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
    required this.ratingsCount,
  });
}
