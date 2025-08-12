import 'package:bookly_app/Features/home/presentation/views/widgets/newset_books_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomAppBar(),
              FeaturedBooksListViwe(),
              SizedBox(height: 40),
              Padding(
                padding: kPadding,
                child: Text(
                  'Newset Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverPadding(
          padding: kPadding,
          sliver: NewsetBooksListView(),
        ),
      ],
    );
  }
}

/*✅ 2. CustomScrollView
📌 المعنى:
بديل متطور لـ SingleChildScrollView، لكنه يدعم أنواع مختلفة من العناصر تسمى Slivers.

📌 ليش نستخدمها؟
لما تحتاج تبني صفحة فيها أجزاء مختلفة قابلة للتمرير بشكل ذكي:

AppBar ثابت أو متحرك
ListView
GridView
وغيرها...

----------------------------------------------

🧠 ببساطة:
"ScrollView ذكي يخليك تبني تصميم معقد فيه قوائم، عناوين، وعناصر أخرى كلها تتحرك بسلاسة."

🧩 خلاصة بشكل بسيط جدًا:
NeverScrollableScrollPhysics	يمنع التمرير الداخلي لعناصر مثل ListView
SliverFillRemaining	يملأ المساحة المتبقية من الشاشة
CustomScrollView	يسمح ببناء تصميم فيه عناصر قابلة للتمرير بطريقة مرنة باستخدام slivers

 */
