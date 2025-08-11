import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}

/*🟦 متى تستخدم GetMaterialApp؟ (من مكتبة GetX)
✅ يفضّل استخدامها إذا كنت:

تريد إدارة حالة(State Management)  بسيطة باستخدام GetX.
 تحتاج تنقل (Navigation) سهل بدون الكثير من الإعداد.

تريد:
  عرض Snackbar, Dialog, BottomSheet بسهولة.
  تمرير بيانات بين الشاشات بسرعة.
  تطور تطبيق صغير أو متوسط بسرعة وكفاءة.

🔸 مميزاتها:
      إعداد سريع.
      كود مختصر وواضح.
      تنقل بدون context.
      كل شيء مدمج (State + Route + UI utils).

------------------------------------

🟨 متى تستخدم MaterialApp.router؟ (نظام Router الرسمي من Flutter)
✅ يفضّل استخدامها إذا كنت:
      تبني تطبيق كبير أو معقد.

تحتاج إلى:
  تحكم كامل بالمسارات والتنقل.
  deep linking للويب.
  حماية مسارات (مثل: منع الوصول لصفحات بدون تسجيل دخول).
  تنظيم التنقل في مكان مركزي (route file).

🔸 مميزاتها:
    يعتمد على نظام declarative navigation.
    جميع المسارات تُعرّف في ملف واحد مما يسهل إدارتها.
    متوافق مع الويب بشكل ممتاز.
    مرن لتطبيقات تعتمد على الحالة (مثل auth/login flows).

------------------------------------

📝 الخلاصة النظرية:
      إذا كنت تحتاج فقط إلى تنقل قوي ومنظم، استخدم MaterialApp.router لأنه يمنحك تحكمًا كاملاً ويُعتبر الحل الرسمي من Flutter.
      أما إذا كنت تريد السهولة والبساطة مع إدارة الحالة، فاستخدم GetMaterialApp من GetX، خاصة في المشاريع المتوسطة والصغيرة.

****************************************************************************

 معلومات اكثرعن مكتبة GetX: و GetMaterialApp: 

✅ ما هي مكتبة get أو GetX؟
  مكتبة GetX هي أداة قوية في Flutter تُستخدم لإدارة الحالة (state management)،
   والتنقل بين الصفحات (routing)، وعرض الرسائل والإشعارات (snackbars/dialogs)، 
   وربط البيانات، كل ذلك بشكل بسيط وسريع جدًا، وبدون تعقيد أو boilerplate code.


✅ ما هو GetMaterialApp؟
    هو بديل لـ MaterialApp، لكن:
    تم تطويره ليعمل مع مكتبة GetX.


✅ يضيف مميزات إضافية مثل:
    التنقل بدون context
    إدارة الحالة
    الترجمة والتعريب
    إدارة الـ Dependency Injection
    عرض Dialogs وSnackbars بسهولة 


✅ متى تستخدم GetMaterialApp؟
  تستخدمه عندما تقرر الاعتماد على مكتبة GetX في مشروعك، حتى تستفيد من مميزاتها الكاملة.
*/
