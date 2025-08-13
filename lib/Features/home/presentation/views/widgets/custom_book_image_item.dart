import 'package:bookly_app/core/widgets/shimmer_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => const ShimmerBox(
            width: double.infinity,
            height: double.infinity,
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error),
        ),
      ),
    );
  }
}

/*🟦 AspectRatio
🔹 وظيفته: تحديد نسبة الطول إلى العرض لعنصر معين.

🔹 متى تستخدمه؟
عندما تريد عنصر (مثل صورة أو فيديو) يظهر بنفس النسبة في كل الأجهزة، بغض النظر عن أبعاد الشاشة.

******************************************************************

 فوائد استخدام CachedNetworkImage
  تخزين الصور (Caching)
    أول مرة تُحمّل الصورة من الإنترنت، يتم حفظها محليًا في ذاكرة التخزين المؤقت (cache).
    في المرات التالية، تُعرض الصورة مباشرة من التخزين المحلي بدل إعادة تحميلها من الإنترنت، مما يزيد السرعة ويوفر البيانات.

  أداء أفضل وسرعة عرض
    بدل الانتظار لتحميل الصور في كل مرة، التطبيق يعرضها فورًا إذا كانت مخزنة، وهذا يعطي إحساسًا بسرعة التطبيق.

  إظهار عناصر مؤقتة (placeholder)
    يمكنك عرض دائرة تحميل (CircularProgressIndicator) أو أي عنصر آخر أثناء تحميل الصورة، مما يحسّن تجربة المستخدم.

  معالجة الأخطاء بسهولة (errorWidget)
    إذا فشل تحميل الصورة (بسبب انقطاع الإنترنت أو رابط خاطئ)، يمكن عرض أيقونة أو صورة بديلة بدل أن ينهار التطبيق أو يظهر مربع فارغ.

  تقليل استهلاك البيانات
    الصور التي تم تحميلها سابقًا لا تحتاج لإعادة التحميل إلا إذا تغيّرت، وهذا مفيد خصوصًا للمستخدمين ذوي الباقات المحدودة.

  دعم مختلف أحجام الصور تلقائيًا
    المكتبة تدير تحميل الصور الكبيرة وتصغيرها بما يناسب عرض الجهاز لتقليل استهلاك الذاكرة.


📌 الخلاصة:
  بدون CachedNetworkImage، أي صورة تُعرض عبر Image.network سيتم تحميلها من الإنترنت في كل مرة تفتح فيها الصفحة، حتى لو كانت نفس الصورة، مما يبطئ التطبيق ويستهلك الإنترنت.
  لكن مع CachedNetworkImage، الصورة تُحفظ محليًا وتُعرض فورًا في المرات التالية، مع إمكانية عرض بدائل إذا حصل خطأ.


📌 اذا كنت تحمل صور من الانترنت CachedNetworkImage، لذلك الخلاصة استخدم دايما 
 */
