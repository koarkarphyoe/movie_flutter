import 'package:flutter/material.dart';
import 'package:movie_flutter/data_vos/data/movie_vo.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/widgets/star_rating_bar.dart';

class MovieView extends StatelessWidget {
  final MovieVO? mMovie;
  MovieView(this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIE_VIEW_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            "$imageBaseUrl${mMovie!.posterPath}",
            // "https://upload.wikimedia.org/wikipedia/en/7/74/The_Wolverine_posterUS.jpg",
            fit: BoxFit.cover,
          ),
          SizedBox(height: MARGIN_MEDIUM_1),
          Text(
            "${mMovie!.title}",
            style: TextStyle(
                fontSize: MOVIE_TITLE_TEXT,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Row(
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
          ),
        ],
      ),
    );
  }
}
