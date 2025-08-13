part of 'search_or_default_books_cubit.dart';

sealed class SearchOrDefaultBooksState extends Equatable {
  const SearchOrDefaultBooksState();

  @override
  List<Object> get props => [];
}

final class SearchOrDefaultBooksInitial
    extends SearchOrDefaultBooksState {}

class SearchOrDefaultBooksLoading extends SearchOrDefaultBooksState {}

class SearchOrDefaultBooksSuccess extends SearchOrDefaultBooksState {
  final List<Item> books;

  const SearchOrDefaultBooksSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class SearchOrDefaultBooksFailure extends SearchOrDefaultBooksState {
  final String errMessage;

  const SearchOrDefaultBooksFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

/*  لماذا نستخدم List<Object> get props => [errMessage/books];

هذا الجزء تابع لمكتبة Equatable في فلاتر و Dart  

لماذا نستخدم Equatable؟
  عندما تستخدم Bloc/Cubit، كل تغيير في الحالة يعتمد على المقارنة بين الحالة السابقة والحالة الجديدة.
  إذا لم تستخدم Equatable، فإن Bloc سيعتبر كل كائن جديد مختلف حتى لو كانت البيانات نفسها.
  Equatable يجعل الكود يعرف متى تكون الحالات متساوية فعلياً.


ما معنى props؟
  props هو قائمة الخصائص التي يجب أن تؤخذ في الاعتبار عند المقارنة.
  في المثال: books هي القائمة التي تحتوي على نتائج البحث أو الكتب الافتراضية.
  عندما تتغير books، Bloc يعرف أن الحالة جديدة ويحدث الواجهة.


الفائدة العملية:
  تحسين أداء Bloc لأنه لا يعيد بناء واجهة المستخدم إلا عند تغير البيانات فعلاً.
  يقلل الأخطاء الناتجة عن إعادة البناء غير الضروري.


باختصار، props تُعرّف ما الذي يجعل هذه الحالة مختلفة عن الحالة السابقة. */
