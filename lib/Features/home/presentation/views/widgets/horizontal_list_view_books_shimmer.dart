import 'package:bookly_app/core/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';

class HorizontalListViewBooksShimmer extends StatelessWidget {
  const HorizontalListViewBooksShimmer({
    super.key,
    this.itemCount = 6,
    required this.imageHeight,
    required this.imageWidth,
    this.paddingHorizontal = 5,
  });
  final int itemCount;
  final double imageHeight;
  final double imageWidth;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height * imageHeight;
    final Width = Height * imageWidth;

    return SizedBox(
      height: Height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
            ),
            child: ShimmerBox(width: Width, height: Height),
          );
        },
      ),
    );
  }
}
