import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/books_models/item.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_or_default_books_state.dart';

class SearchOrDefaultBooksCubit
    extends Cubit<SearchOrDefaultBooksState> {
  SearchOrDefaultBooksCubit(this.searchRepo)
    : super(SearchOrDefaultBooksInitial());

  final SearchRepo searchRepo;
  List<Item>? _cachedDefaultBooks;

  Future<void> fetchDefaultBooks() async {
    // إذا كانت البيانات موجودة في الكاش، استخدمها مباشرة
    if (_cachedDefaultBooks != null) {
      emit(SearchOrDefaultBooksSuccess(_cachedDefaultBooks!));
      return;
    }

    emit(SearchOrDefaultBooksLoading());
    var result = await searchRepo.fetchDefaultBooks();
    _handleResult(result, isDefault: true);
  }

  Future<void> searchBooks({required String query}) async {
    if (query.isEmpty) {
      fetchDefaultBooks();
      return;
    }
    emit(SearchOrDefaultBooksLoading());
    var result = await searchRepo.searchBooks(query: query);
    _handleResult(result);
  }

  void _handleResult(
    Either<Failure, List<Item>> result, {
    bool isDefault = false,
  }) {
    result.fold(
      (failure) =>
          emit(SearchOrDefaultBooksFailure(failure.errMessage)),
      (books) {
        if (isDefault && _cachedDefaultBooks == null) {
          _cachedDefaultBooks = books;
          // خزّن البيانات الافتراضية فقط مرة واحدة
        }
        emit(SearchOrDefaultBooksSuccess(books));
      },
    );
  }
}
/* من اجل التالي _cachedDefaultBooks استخدمنا 
    تُستخدم لتخزين البيانات الافتراضية التي تم جلبها أول مرة.
    الفكرة هي أنه عند عرض الشاشة للمرة التالية أو عند مسح نص البحث، 
    نستخدم هذه البيانات المخزنة مباشرة بدلاً من إرسال طلب جديد للإنترنت.
    هذا يحسن الأداء ويقلل استهلاك البيانات، ويضمن أن المستخدم يرى دائمًا 
    الكتب الافتراضية بسرعة دون انتظار التحميل. */