import 'package:books_app/feature/home/presentation/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) => BestSellerListViewItem(),

      separatorBuilder: (context, int index) =>
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

      itemCount: 10,
    );
  }
}
