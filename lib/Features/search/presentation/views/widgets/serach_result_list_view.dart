import 'package:bookly_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/manger/search_or_default_books/search_or_default_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SerachResultListView extends StatelessWidget {
  const SerachResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      SearchOrDefaultBooksCubit,
      SearchOrDefaultBooksState
    >(
      builder: (context, state) {
        if (state is SearchOrDefaultBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchOrDefaultBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
