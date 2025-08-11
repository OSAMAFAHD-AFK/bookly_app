import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) // نفحص نوع الخطأ
    {
      case DioExceptionType.connectionTimeout: // انتهت مهلة الاتصال
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout: // انتهت مهلة الإرسال
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout: // انتهت مهلة استقبال الرد
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate: // مشكلة في شهادة SSL
        return ServerFailure('BadCertificate with ApiServer');
      case DioExceptionType.badResponse: // السيرفر رجع رد خطأ
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel: // تم إلغاء الطلب
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError: // خطأ في الاتصال
        // إذا الخطأ سببه انقطاع الإنترنت
        if (dioException.error is SocketException ||
            (dioException.message != null &&
                dioException.message!.contains('SocketException'))) {
          return ServerFailure('No Internet connection');
        }
        // خطأ اتصال عام
        return ServerFailure(
          'Connection Error, please try again later!',
        );

      case DioExceptionType.unknown: // خطأ غير معروف
        return ServerFailure('UnException Error, Please try again!');
    }
  }
  factory ServerFailure.fromResponse(
    int statusCode,
    dynamic response,
  ) {
    // ملاحظة: هذا الكود مخصص لكتابة الأخطاء المحتملة التي ترجع من API */

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        'Your request not found, Please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        'Internat Server error, Please try later!',
      );
    } else {
      return ServerFailure(
        'Opps There was an Error, Please try again!',
      );
    }
  }
}

/*فايدة هذة الكلاس  هي  :

توفير رسائل خطأ دقيقة للمستخدم
  بدل ما تقول "حدث خطأ"، تقدر تقول له "لا يوجد اتصال بالإنترنت" أو "انتهت مهلة الاتصال" أو "الخادم لا يستجيب".

تحسين تجربة المستخدم (UX)
  المستخدم يفهم سبب المشكلة ويتصرف بناءً عليه، مثلاً إذا عرف أن المشكلة من الإنترنت يحاول إعادة الاتصال.

تسهيل عملية تصحيح الأخطاء (Debugging)
  أنت كمطور تعرف بالضبط نوع المشكلة من خلال النوع المحدد (connectionError, receiveTimeout, badResponse، إلخ) فتقدر تصلحها أسرع.
  إمكانية اتخاذ إجراءات مختلفة لكل نوع خطأ


مثلاً:
  إذا كان connectionError → تعرض زر "إعادة المحاولة".
  إذا كان receiveTimeout → تقلل حجم البيانات أو تغير طريقة الطلب.
  إذا كان badResponse → تعرض رسالة "هناك مشكلة في الخادم".
  إعداد استراتيجيات Retry أو Offline Mode
  إذا الخطأ من الإنترنت، تقدر تخزن الطلب مؤقتًا وتعيد إرساله لاحقًا.

باختصار:
  الفائدة الأساسية هي تحكم كامل في سلوك التطبيق حسب نوع المشكلة بدل ما تعطي رد عام وغير واضح. */
