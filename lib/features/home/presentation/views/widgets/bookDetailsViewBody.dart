import 'package:bookly_app/features/home/data/models/book_model/book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/booksDetailsSection.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customBookDetailsAppBar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similarBooksSection.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsViewBody({
    Key? key, required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children:  [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel,),
                const Expanded(
                  child: const SizedBox(
                    height: 35,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
