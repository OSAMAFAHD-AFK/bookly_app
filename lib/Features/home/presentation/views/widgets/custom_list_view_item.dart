import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
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
      ),
    );
  }
}

/*🟦 1. MediaQuery
🔹 وظيفته: الحصول على معلومات عن أبعاد شاشة الجهاز الحالي.

🔹 متى تستخدمه؟
عندما تريد أن تضبط عرض أو ارتفاع عنصر في الواجهة بناءً على حجم الشاشة الفعلي.



🟦 2. AspectRatio
🔹 وظيفته: تحديد نسبة الطول إلى العرض لعنصر معين.

🔹 متى تستخدمه؟
عندما تريد عنصر (مثل صورة أو فيديو) يظهر بنفس النسبة في كل الأجهزة، بغض النظر عن أبعاد الشاشة.


💡 خلاصة عملية:
    لو بتصمم تطبيق وتبغى يكون متجاوب في كل الجوالات:
    استخدم MediaQuery لتحديد الأحجام بنسب من الشاشة.
    استخدم AspectRatio للحفاظ على شكل الصور/الفيديوهات أو أي عنصر له نسبة معينة.
    وممكن تجمع الاثنين مع بعض داخل Layout واحد.
 */
