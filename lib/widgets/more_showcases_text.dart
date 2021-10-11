import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/dimens.dart';


class MoreShowCases extends StatelessWidget {
  final String titleText;
  final Color textColor;
  MoreShowCases(this.titleText,{this.textColor=Colors.white});


  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: BEST_POPULAR_FILMS_AND_SERIALS_TEXT_SIZE,
          color: textColor,
          decoration: TextDecoration.underline),
    );
  }
}
