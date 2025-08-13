import 'package:bookly_app/core/models/books_models/item.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Item>>> fetchDefaultBooks();
  Future<Either<Failure, List<Item>>> searchBooks({
    required String query,
  });
}
