import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/widgets/star_rating_bar.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIE_VIEW_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MovieImageView(),
          SizedBox(height: MARGIN_MEDIUM_1),
          MovieTitleTextView(),
          MovieRatingBarView(),
        ],
      ),
    );
  }
}

class MovieRatingBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "8.20",
          style: TextStyle(
              fontSize: MOVIE_TITLE_TEXT,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
        SizedBox(width: MARGIN_MEDIUM_1),
        StarRatingBar(),
      ],
    );
  }
}

class MovieTitleTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Westworld",
      style: TextStyle(
          fontSize: MOVIE_TITLE_TEXT,
          fontWeight: FontWeight.w500,
          color: Colors.white),
    );
  }
}

class MovieImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnt0bHvCWQmOoCieTbnBya250f4A2G1TCr1HWHD929LxSft_hhGAsWw3FbjTLN3JjVvcE&usqp=CAU",
      fit: BoxFit.cover,
    );
  }
}
