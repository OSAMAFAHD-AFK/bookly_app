import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const SplashView(),
    );
  }
}

/*✅ ما هي مكتبة get أو GetX؟
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
