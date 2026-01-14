import 'package:books_app/core/utils/show_toast_state.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/feature/home/presentation/manager/newestBook/newest_book_cubit.dart';
import 'package:books_app/feature/home/presentation/manager/newestBook/newest_book_states.dart';
import 'package:books_app/feature/home/presentation/widgets/book_list_view_bloc_builder.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:books_app/feature/home/presentation/widgets/custom_best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              child: NewestBooksBlocConsumerListView(),
            ),
          ),
        ],
      ),
    );
  }
}

class NewestBooksBlocConsumerListView extends StatelessWidget {
  const NewestBooksBlocConsumerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksCubitStates>(
      listener: (context, state) {
        if (state is NewestBooksPaginationFailureState) {
          return showToast(text: 'Pagination Error', state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<NewestBooksCubit>();
        if (state is NewestBooksSuccessState ||
            state is NewestBooksPaginationLoadingState ||
            state is NewestBooksPaginationFailureState) {
          return CustomBestSellerListView(book: cubit.newestBooks);
        } else if (state is NewestBooksFailureState) {
          return Text(state.errorMassege);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
