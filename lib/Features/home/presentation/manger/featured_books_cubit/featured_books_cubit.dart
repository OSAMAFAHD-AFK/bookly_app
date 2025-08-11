import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/books_models/item.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
