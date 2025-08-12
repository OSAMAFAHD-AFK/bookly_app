import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksListView extends StatelessWidget {
  const NewsetBooksListView({super.key});

  @override // حل افضل من chat gpt
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              ),
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return SliverToBoxAdapter(
            child: const CustomLoadingIndicator(),
          );
        }
      },
    );
  }

  /* @override // الحل الاولي وشرح الاستاذ
  Widget build(BuildContext context) { 
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const BookListViewItem(),
        );
      },
    );
  }*/
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
 
 ----------------------------------------------------------------------
 
 الفرق النظري بين SliverList و ListView:
    التوافق مع CustomScrollView:
      SliverList: مخصص لها ويُندمج مباشرة.
      ListView: غير متوافق طبيعيًا، يحتاج تلاعب.

    الأداء:
      SliverList: أسرع ويحمل العناصر بشكل كسول (lazy loading).
      ListView: أبطأ، قد يحمل كل العناصر دفعة واحدة.

    السكرول (Scrolling):
      SliverList: سكرول موحد وسلس مع باقي Slivers.
      ListView: يحصل تضارب في السكروولات (Nested Scrolling).

    التحكم بالعرض:
      SliverList: مرن ويأخذ فقط المساحة التي يحتاجها.
      ListView: أحيانًا لا يعرض كل العناصر بشكل صحيح.

    تصميم الشاشة:
      SliverList: مثالي لتصميمات صفحات قابلة للتمرير (scrollable pages).
      ListView: يعقد التصميم داخل ScrollView.

---------------

 هل SliverList يبني كل العناصر أم فقط التي تظهر على الشاشة؟
الجواب:
SliverList يبني فقط العناصر التي تظهر على الشاشة (lazy loading)، أي أنه لا يبني كل العناصر دفعة واحدة، بل يبني العناصر عند الحاجة أثناء التمرير (scroll).*/
