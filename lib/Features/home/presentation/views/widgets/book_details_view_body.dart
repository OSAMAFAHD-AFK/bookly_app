import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Column(children: const [CustomBookDetailsAppBar()]),
    );
  }
}
