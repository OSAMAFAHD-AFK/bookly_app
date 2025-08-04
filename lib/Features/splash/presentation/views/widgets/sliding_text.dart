import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //تعيد بناء نفسها كل ما تغيرت قيمة الأنميشن بدلا من اعدة بناء كل الودجة
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          // تحرك النص حسب الـ Offset المتغير.
          position: slidingAnimation,
          child: Text(
            'Read Free Books',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
