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

  /// جلب الكتب الافتراضية
  Future<void> fetchDefaultBooks() async {
    emit(SearchOrDefaultBooksLoading());
    var result = await searchRepo.fetchDefaultBooks();
    _handleResult(result);
  }

  /// البحث حسب النص
  Future<void> searchBooks({required String query}) async {
    if (query.isEmpty) {
      fetchDefaultBooks();
      return;
    }
    emit(SearchOrDefaultBooksLoading());
    var result = await searchRepo.searchBooks(query: query);
    _handleResult(result);
  }

  void _handleResult(Either<Failure, List<Item>> result) {
    result.fold(
      (failure) =>
          emit(SearchOrDefaultBooksFailure(failure.errMessage)),
      (books) => emit(SearchOrDefaultBooksSuccess(books)),
    );
  }
}
