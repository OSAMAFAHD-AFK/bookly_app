import 'package:bookly_app/core/widgets/book_list_view_item_shimmer.dart';
import 'package:flutter/material.dart';

class SerachResultListViewShimmer extends StatelessWidget {
  const SerachResultListViewShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItemShimmer(),
        );
      },
    );
  }
}
