import 'package:bookly_app/Features/home/data/models/books_models/books_models.dart';
import 'package:bookly_app/Features/home/data/models/books_models/item.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<Item>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest',
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
  Future<Either<Failure, List<Item>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
