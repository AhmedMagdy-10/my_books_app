import 'package:books_app/feature/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomListViewBooksItems extends StatelessWidget {
  const CustomListViewBooksItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListViewBookItem();
        },
      ),
    );
  }
}
