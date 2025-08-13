import 'package:bookly_app/Features/search/presentation/manger/search_or_default_books/search_or_default_books_cubit.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSerachTextField extends StatelessWidget {
  const CustomSerachTextField({super.key});

  @override
  Widget build(BuildContext context) {
    String? nameBook;
    return TextField(
      onChanged: (value) {
        nameBook = value;
        if (value.isEmpty) {
          searchBooks(context, nameBook);
        }
      },
      onSubmitted: (value) {
        searchBooks(context, value);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Serach',
        suffixIcon: IconButton(
          onPressed: () {
            searchBooks(context, nameBook);
          },
          icon: SvgPicture.asset(AssetsData.search, height: 35),
        ),
      ),
    );
  }

  void searchBooks(BuildContext context, String? value) {
    context.read<SearchOrDefaultBooksCubit>().searchBooks(
      query: value ?? '',
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
