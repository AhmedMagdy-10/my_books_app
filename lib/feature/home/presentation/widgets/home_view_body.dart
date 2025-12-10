import 'package:books_app/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}
