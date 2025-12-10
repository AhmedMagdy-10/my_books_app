import 'package:books_app/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_books_items.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [CustomAppBar(), CustomListViewBooksItems()]),
    );
  }
}
