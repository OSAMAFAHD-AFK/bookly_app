import 'package:bookly_app/Features/search/presentation/views/widgets/custom_serach_text_fiel.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/serach_result_list_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class SerachViewBody extends StatelessWidget {
  const SerachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          CustomSerachTextField(),
          SizedBox(height: 20),
          Text('Serach Result', style: Styles.textStyle18),
          SizedBox(height: 20),
          Expanded(child: SerachResultListView()),
        ],
      ),
    );
  }
}
