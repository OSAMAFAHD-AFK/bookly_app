import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .23,
            ),
            child: const CustomBookImageItem(),
          ),
          const SizedBox(height: 40),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Opacity(
            opacity: .7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 18),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 37),
          const BooksAction(),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SimilarBooksListView(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
