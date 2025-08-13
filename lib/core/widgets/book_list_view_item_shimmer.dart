import 'package:bookly_app/core/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';

class BookListViewItemShimmer extends StatelessWidget {
  const BookListViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHeight = 125.0;
    final imageWidth = imageHeight * 2.6 / 4;
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          ShimmerBox(width: imageWidth, height: imageHeight),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 20,
                ),
                const SizedBox(height: 5),
                ShimmerBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 14,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerBox(width: 50, height: 20),
                    ShimmerBox(width: 40, height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
