import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(AssetsData.test_image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

/*🟦 AspectRatio
🔹 وظيفته: تحديد نسبة الطول إلى العرض لعنصر معين.

🔹 متى تستخدمه؟
عندما تريد عنصر (مثل صورة أو فيديو) يظهر بنفس النسبة في كل الأجهزة، بغض النظر عن أبعاد الشاشة.

 */
