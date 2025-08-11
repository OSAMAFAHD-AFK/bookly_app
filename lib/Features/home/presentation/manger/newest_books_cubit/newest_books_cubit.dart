import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/books_models/item.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
}
