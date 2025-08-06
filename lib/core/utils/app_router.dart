import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String ksplashView = '/';
  static const String khomeView = '/HomeView';

  static final GoRouter router = GoRouter(
    initialLocation:
        '/', // 👈 اجعل التطبيق يفتح مباشرة على صفحة معينة
    routes: [
      GoRoute(
        path: ksplashView,
        builder: (context, state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: khomeView,
            builder: (context, state) {
              return const HomeView();
            },
          ),
        ],
      ),
    ],
  );
}

/*🔹 ميزة استخدام GoRouter (أو نظام الراوتر بشكل عام) في Flutter:
    من أهم مزايا استخدام GoRouter هي أنه يوفّر طريقة مركزية وموحدة لتعريف جميع الشاشات (routes) في التطبيق، في مكان واحد.
    هذا يسهل على المطور فهم هيكل التنقل، وتعديل المسارات، والتنقل بين الشاشات بشكل مرن وسلس.

✅ أبرز الفوائد:
    تنظيم عالي للتنقل: جميع الصفحات (Views) تُعرّف داخل ملف واحد، مما يمنع التكرار أو العشوائية.
    سهولة التنقل: يمكنك التنقل إلى أي صفحة باستخدام المسار مباشرة بدون الحاجة لتعريف route في كل مرة.
    دعم المسارات المتداخلة: مثل الانتقال من splash إلى home أو صفحات فرعية بسهولة.
    تحكم كامل بالمسارات: تستطيع التحكم في من يدخل إلى كل صفحة (مثلاً حماية صفحة تسجيل الدخول).
    دعم للويب و Deep Linking: جيد جدًا لتطبيقات الويب حيث يمكن التنقل باستخدام الروابط مثل المواقع.
    تحسينات للمعمارية (Architecture): يُسهل تقسيم التطبيق بطريقة نظيفة وقابلة للتوسع. 
    
💡 مثال توضيحي:
      بدل ما تكتب Route لكل صفحة في كل مكان، تستخدم ملف AppRouter 
      وتضع فيه كل المسارات في مكان واحد، وتستخدم الأسماء المعرّفة (مثل: khomeView) 
      للتنقل، مما يجعل الكود أنظف وأسهل للصيانة والتوسع مستقبلًا.
      
 ---------------------------------------------

  initialLocation متى تستخدمها  
    عندما تكون تبني تطبيق كبير فيه أكثر من صفحة، وتريد فقط:
    اختبار شاشة معينة (مثلاً: صفحة تسجيل الدخول أو صفحة الطلبات).
    أو تتأكد من تصميم صفحة معينة بدون الحاجة إلى المرور بكل الخطوات التي تسبقها. */
