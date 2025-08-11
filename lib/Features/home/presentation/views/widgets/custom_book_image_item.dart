import 'package:flutter/material.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
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
