import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/colors.dart';
import 'package:movie_flutter/resources/dimens.dart';


class TitleText extends StatelessWidget {
  final String titleText;
  TitleText (this.titleText);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: BEST_POPULAR_FILMS_AND_SERIALS_TEXT_SIZE,
          color: MOVIE_BEST_POPULAR_FILMS_AND_SERIALS_COLOR),
    );
  }
}
