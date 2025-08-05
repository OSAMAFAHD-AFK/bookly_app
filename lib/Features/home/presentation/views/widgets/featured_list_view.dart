import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViwe extends StatelessWidget {
  const FeaturedBooksListViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}

/*🟦 MediaQuery
🔹 وظيفته: الحصول على معلومات عن أبعاد شاشة الجهاز الحالي.

🔹 متى تستخدمه؟
عندما تريد أن تضبط عرض أو ارتفاع عنصر في الواجهة بناءً على حجم الشاشة الفعلي. */
