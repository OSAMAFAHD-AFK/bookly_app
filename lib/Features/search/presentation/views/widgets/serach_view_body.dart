import 'package:bookly_app/Features/search/presentation/views/widgets/custom_serach_text_fiel.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class SerachViewBody extends StatelessWidget {
  const SerachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Column(children: const [CustomSerachTextField()]),
    );
  }
}
