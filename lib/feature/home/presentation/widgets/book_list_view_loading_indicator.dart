import 'package:books_app/core/widget/custom_fading_widget.dart';
import 'package:books_app/feature/home/presentation/widgets/feature_books_image_loading_indicator.dart';
import 'package:flutter/cupertino.dart';

class BookListViewLoadingIndicator extends StatelessWidget {
  const BookListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) =>
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return FeatureBooksImageLoadingIndicator();
          },
        ),
      ),
    );
  }
}
