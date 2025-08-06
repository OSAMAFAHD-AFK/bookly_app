import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const BestSellerListViewItem(),
          );
        },
      ),
    );
  }
}

/*✅ 1. NeverScrollableScrollPhysics
📌 المعنى:
تمنع الـ ListView من التمرير (scroll).

📌 ليش نستخدمها؟
في حالتك، عندك CustomScrollView هو المسؤول عن التمرير، وفي داخله فيه ListView (داخل SliverFillRemaining).
لو خليت ListView قابل للتمرير أيضًا، حيحصل تعارض في التمرير → وهذا يسبب مشاكل أو سلوك غير مرغوب فيه.

🧠 ببساطة:
NeverScrollableScrollPhysics تعني:
"خليني أخلي الـ ListView يظهر العناصر، لكن ما يلف من نفسه، التمرير يكون من فوق (من الـ CustomScrollView)."
 */
