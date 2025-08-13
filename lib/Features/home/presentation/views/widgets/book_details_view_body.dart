import 'package:bookly_app/core/models/books_models/item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final Item bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: kPadding,
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 8),
                BookDetailsSection(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 50)),
                /* لماذا استخدم Expanded()؟
                    دفع العناصر التي بعده  نحو الأسفل.
                    حتى تظل هذه العناصر في أسفل الشاشة إذا كانت الشاشة طويلة. */
                const SimilarBooksSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/*📌 لماذا SliverFillRemaining:
حتى لو المحتوى قليل، تضمن أن المحتوى يتمدد ليملأ الشاشة، بدلاً من أن يتراكم في الأعلى فقط.
نريد ملء المساحة المتبقية من الشاشة بمحتوى (حتى لو المحتوى قليل). 
✅ 1. SliverFillRemaining
📌 المعنى:
تملأ المساحة المتبقية في الشاشة بما بداخلها (مثل Expanded لكن في slivers).

📌 ليش نستخدمها؟
عشان تخلي مثلاً الـ ListView يأخذ باقي الشاشة تحت الـ AppBar و الـ FeaturedBooks.

🧠 ببساطة:
"كل المساحة اللي بقيت في الشاشة بعد العناصر اللي فوق؟ حط فيها هذا الودجت."

--------------------------------------

✅ لماذا نستخدم Sections مثل BookDetailsSection و SimilarBooksSection:
    📚 تنظيم الكود: يجعل الكود مرتب وسهل القراءة.
    🔁 إعادة الاستخدام: يمكنك استخدام نفس الـ Widget في صفحات أخرى.
    🧪 سهولة الاختبار: كل جزء يُختبر بشكل منفصل.
    ⚙️ سهولة الصيانة: تعدّل جزء بدون التأثير على الباقي.
    🚀 تحسين الأداء: Flutter يعيد بناء الجزء المتغيّر فقط.
    📐 تطبيق المبادئ البرمجية: مثل "مبدأ المسؤولية الواحدة".
*/
