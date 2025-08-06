import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
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
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(child: BestSellerListView()),
      ],
    );
  }
}

/*✅ 1. SliverFillRemaining
📌 المعنى:
تملأ المساحة المتبقية في الشاشة بما بداخلها (مثل Expanded لكن في slivers).

📌 ليش نستخدمها؟
عشان تخلي مثلاً الـ ListView يأخذ باقي الشاشة تحت الـ AppBar و الـ FeaturedBooks.

🧠 ببساطة:
"كل المساحة اللي بقيت في الشاشة بعد العناصر اللي فوق؟ حط فيها هذا الودجت."

--------------------------------------

✅ 2. CustomScrollView
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
