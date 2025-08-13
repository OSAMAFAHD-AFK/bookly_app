import 'package:flutter/material.dart';
import '../../../../../core/widgets/book_list_view_item_shimmer.dart';

class NewsetBooksListViewShimmer extends StatelessWidget {
  const NewsetBooksListViewShimmer({super.key, this.itemCount = 6});

  final int itemCount; // عدد عناصر Shimmer

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const BookListViewItemShimmer(),
        ),
        childCount: itemCount,
      ),
    );
  }
}
