import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_botton.dart';
import 'package:bookly_app/features/home/data/models/book_model/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children:  [
          Expanded(
            child: CustomBotton(
              text: '19.99 \$ ',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomBotton(
              onPressed:(){
                launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              }              ,
              text: getText(bookModel),
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }


  String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Available';
    }else{
      return 'Preview';
    }
  }
}
