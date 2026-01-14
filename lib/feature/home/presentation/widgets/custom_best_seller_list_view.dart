import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/presentation/manager/newestBook/newest_book_cubit.dart';
import 'package:books_app/feature/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBestSellerListView extends StatefulWidget {
  const CustomBestSellerListView({super.key, required this.book});

  final List<BookEntity> book;

  @override
  State<CustomBestSellerListView> createState() =>
      _CustomBestSellerListViewState();
}

class _CustomBestSellerListViewState extends State<CustomBestSellerListView> {
  final ScrollController scrollController = ScrollController();

  bool isLoading = false;
  int nextPage = 1;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() async {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      final cubit = context.read<NewestBooksCubit>();
      if (!cubit.isLoadingNewestBooks) {
        cubit.getNewestBooks(pageNamber: nextPage);
        nextPage++;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) =>
          BestSellerListViewItem(bookEntity: widget.book[index]),

      separatorBuilder: (context, int index) =>
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

      itemCount: widget.book.length,
    );
  }
}
