import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // يقوم بتمديد العمود لملء الشاشة
      children: [
        Image.asset(AssetsData.Logo),
        const SizedBox(height: 8),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // مدة الأنميشن
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
    // تبدأ تشغيل الأنميشن (من البداية للنهاية)
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fade,
        duration: kTransitionDuration,
      );
    });
  }
}

/* SingleTickerProviderStateMixin 
هي لتمكين الرسوم المتحركة في هذه الودجة
vsync يجعل الكلاس قادر على إدارة أنميشن واحد بكفاءة باستخدام 

AnimationController: 
 هذا المتحكم الأساسي في الرسوم المتحركة: يحدد المدة ويبدأ/يوقف الأنميشن.

Animation<Offset>:
  هذا هو نوع الأنميشن الذي نستخدمه هنا، وهو يحرك عنصرًا على المحورين x و y.
  هذا هو "قيمة" الأنميشن الفعلية التي تتغير من نقطة إلى أخرى (هنا: تحريك عنصر على المحور y).

Tween<Offset>:
controller هذا هو الكائن الذي يحدد بداية ونهاية الرسوم المتحركةثم تربط الحركة بالـ */
