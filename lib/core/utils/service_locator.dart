import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiService>()),
  );

  /* getIt.registerSingleton<AuthRepoImpl>( // اخر في الطبيق Repo لو كان معك 
    AuthRepoImpl(getIt.get<ApiService>()),
  ); */
}

/* Dependency Injection من اجل تطبيق مبدء GetIt  استخدمنا مكتبة 

1. Singleton (Design Pattern): (التعريف والفائدة)
التعريف: نمط تصميم (Design Pattern) يضمن إنشاء نسخة واحدة فقط من الكائن طوال فترة تشغيل التطبيق.

الفائدة:
  توفير استهلاك الذاكرة (لا يتم إنشاء نسخ متعددة من نفس الكائن).
  سهولة مشاركة نفس الكائن بين أجزاء مختلفة من التطبيق.
  الاحتفاظ بالحالة (State) داخل الكائن طوال عمر التطبيق.

-----------------------------

2. Service Locator: (التعريف والفائدة)
التعريف: أسلوب لإدارة الـ Dependencies (الكائنات التي يحتاجها الكود) بحيث يمكنك الوصول لها من أي مكان في المشروع بدون إعادة إنشائها.

الفائدة:
  تنظيم الكود وجعل إنشاء الكائنات في مكان واحد.
  تسهيل إعادة استخدام نفس الكائن (Dependency Reuse).
  تسهيل الاختبار (Testing) عبر استبدال الكائنات الحقيقية بـ Mock بسهولة.
  فصل أماكن إنشاء الكائنات عن أماكن استخدامها (Decoupling).

-----------------------------

3. الفرق عن الطريقة العادية

الطريقة العادية:
HomeRepoImpl(ApiService(Dio()));
تنشئ نسخة جديدة من ApiService و HomeRepoImpl كل مرة.
صعب إعادة استخدامها أو استبدالها في الاختبارات.
ممكن يستهلك موارد أكثر إذا كان الكائن ثقيل.

باستخدام Singleton + Service Locator:
getIt.registerSingleton<ApiService>(ApiService(Dio()));
getIt.registerSingleton<HomeRepoImpl>(
  HomeRepoImpl(getIt.get<ApiService>()),
);
نسخة واحدة فقط تُنشأ مرة واحدة وتُستخدم في كل مكان.
أسهل في الاختبار والتعديل.
أوضح في تنظيم المشروع.

-----------------------------

4. الخلاصة
Singleton = نسخة واحدة من الكائن طوال عمر التطبيق.
Service Locator = مكان مركزي تدير فيه هذه النسخ وتستدعيها عند الحاجة.
النتيجة = تنظيم أفضل، أداء أحسن، واختبارات أسهل.

-----------------------------

5. هذه فوائد استخدام Service Locator مع Singleton على شكل نقاط واضحة:

  توفير الموارد:
    يتم إنشاء نسخة واحدة فقط من الكائن بدل إنشاء نسخ متعددة، مما يقلل استهلاك الذاكرة.

  سهولة إعادة الاستخدام:
    يمكن استخدام نفس النسخة من الكائن في أي مكان داخل التطبيق بدون الحاجة لإعادة إنشائه.

  تحسين تنظيم الكود:
    جميع الاعتمادات (Dependencies) تُدار من مكان مركزي واحد، مما يسهل فهم وصيانة الكود.

  تسهيل الاختبارات (Testing):
    يمكن استبدال الكائنات الحقيقية بكائنات وهمية (Mocks) بسهولة للاختبار.

  فصل إنشاء الكائنات عن استخدامها (Decoupling):
    الكود الذي يستخدم الكائن لا يحتاج أن يعرف كيف وأين تم إنشاؤه، فقط يستدعيه من الـ Service Locator.

  تسهيل إدارة دورة حياة الكائنات:
    يمكن التحكم بوقت إنشاء الكائنات وإعادة استخدامها طوال عمر التطبيق.

  تسريع تطوير التطبيق:
    يقلل من تكرار إنشاء الكائنات وكتابة الكود المتكرر.

  التوافق مع أنماط تصميم أخرى:
  بسهولة (Dependency Injection) يساعد في تطبيق مبدئ  . */
