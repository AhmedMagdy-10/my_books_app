import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/presentation/widgets/book_list_view_bloc_builder.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_best_seller_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                BooksListViewBlocBuilder(),

                SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Best Sellers', style: Styles.textStyle18),
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomBestSellerListView(),
            ),
          ),
        ],
      ),
    );
  }
}
