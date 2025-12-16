import 'package:books_app/feature/home/presentation/widgets/books_details_bottom_sheet_view.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomListViewBooksItems extends StatelessWidget {
  const CustomListViewBooksItems({super.key, required this.listHeight});

  final double listHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * listHeight,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
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
            child: ListViewBookItem(),
          );
        },
      ),
    );
  }
}
