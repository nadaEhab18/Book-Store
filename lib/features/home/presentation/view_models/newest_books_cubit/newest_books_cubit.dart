import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async{
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure){
      emit(NewestBooksFailure(failure.errMsg));
    }, (books){
      emit(NewestBooksSuccess(books));
    });
  }
}
