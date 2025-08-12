import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(Icons.star, color: Color(0xffFFDD4F)),
        const SizedBox(width: 6.3),
        Text(rating.toString(), style: Styles.textStyle18),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
