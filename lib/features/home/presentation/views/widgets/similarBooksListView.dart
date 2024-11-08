import 'package:bookly_app/core/widgets/custom_Loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customBookItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if( state is SimilarBooksSuccess){
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomBookImage(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  );
                }),
          );
        }else if (state is SimilarBooksFailure){
          return CustomErrorWidget(errorMessage: state.errMsg);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
