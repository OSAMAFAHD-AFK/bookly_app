import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
<<<<<<< HEAD
import 'package:bookly_app/constants.dart';
=======
>>>>>>> 45dd6919e2a16bbe7eeea4ac10a93f4c7b51e48d
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const SplashView(),
    );
=======
    return GetMaterialApp(home: SplashView());
>>>>>>> 45dd6919e2a16bbe7eeea4ac10a93f4c7b51e48d
  }
}
