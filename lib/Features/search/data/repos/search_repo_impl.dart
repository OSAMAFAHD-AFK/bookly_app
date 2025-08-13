import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/books_models/books_models.dart';
import 'package:bookly_app/core/models/books_models/item.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Item>>> searchBooks({
    required String query,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=$query',
      );

      BooksModels booksModels = BooksModels.fromJson(data);

      return right(booksModels.items ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Item>>> fetchDefaultBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest',
      );

      BooksModels booksModels = BooksModels.fromJson(data);

      return right(booksModels.items ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
