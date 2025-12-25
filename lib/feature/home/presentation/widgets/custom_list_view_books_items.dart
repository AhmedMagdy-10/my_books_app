import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit.dart';
import 'package:books_app/feature/home/presentation/widgets/books_details_bottom_sheet_view.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomListViewBooksItems extends StatefulWidget {
  const CustomListViewBooksItems({
    super.key,
    required this.listHeight,
    required this.books,
  });

  final double listHeight;
  final List<BookEntity> books;

  @override
  State<CustomListViewBooksItems> createState() =>
      _CustomListViewBooksItemsState();
}

class _CustomListViewBooksItemsState extends State<CustomListViewBooksItems> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    var currentPositions = scrollController.position.pixels;
    var maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      BlocProvider.of<BooksCubit>(context).getMainBooksUseCase();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.listHeight,
      child: ListView.separated(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showBarModalBottomSheet(
                barrierColor: Colors.black12,
                enableDrag: true,
                expand: false,
                duration: const Duration(milliseconds: 500),
                backgroundColor: Colors.white,
                context: context,
                animationCurve: Curves.easeInOutQuart,
                elevation: 0,
                bounce: true,

                builder: (context) => BooksDetailsBottomSheetView(),
              );
            },
            child: ListViewBookItem(image: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
