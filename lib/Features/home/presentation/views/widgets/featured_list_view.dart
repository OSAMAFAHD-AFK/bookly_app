import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/horizontal_list_view_books_shimmer.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListViwe extends StatelessWidget {
  const FeaturedBooksListViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),

                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: CustomBookImageItem(
                      imageUrl:
                          state
                              .books[index]
                              .volumeInfo
                              .imageLinks
                              ?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const HorizontalListViewBooksShimmer(
            itemCount: 6,
            imageHeight: 0.26,
            imageWidth: 2.6 / 4,
            paddingHorizontal: 8,
          );
        }
      },
    );
  }
}

/*🟦 MediaQuery
🔹 وظيفته: الحصول على معلومات عن أبعاد شاشة الجهاز الحالي.

🔹 متى تستخدمه؟
عندما تريد أن تضبط عرض أو ارتفاع عنصر في الواجهة بناءً على حجم الشاشة الفعلي. */
