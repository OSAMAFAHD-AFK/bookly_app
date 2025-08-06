import 'package:bookly_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: HomeViewBody()));
  }
}

/*SafeArea  ما هي ببساطة 
    ببساطة، SafeArea في Flutter هي ويدجيت (Widget) تُستخدم لضمان أن محتوى التطبيق لا يتداخل مع أجزاء الشاشة المحجوزة مثل:
    النوتش (Notch) – الجزء العلوي من بعض الشاشات الحديثة.
    شريط الحالة (Status bar) – الذي يظهر فيه الساعة والشبكة.
    شريط التنقل (Navigation bar) – في الأسفل ببعض الأجهزة. 

📌 متى تستخدمها؟
    استخدم SafeArea عندما تضع عناصر قريبة من حواف الشاشة، خصوصًا في الأعلى أو الأسفل.*/
