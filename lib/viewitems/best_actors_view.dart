import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/colors.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/widgets/title_text.dart';

class BestActorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_1),
      width: BEST_ACTORS_VIEW_WIDTH,
      child: Stack(
        children: [
          BestActorsImageView(),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_1),
              child: FavoriteIconView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActorsNameView(),
                  Row(
                    children: [
                      ThumbUpIconView(),
                      SizedBox(width: MARGIN_MEDIUM_1),
                      YouLikeTextView(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActorsNameView extends StatelessWidget {
  const ActorsNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Leonardo Dicaprio",
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: ACTOR_TEXT_SIZE),
    );
  }
}

class YouLikeTextView extends StatelessWidget {
  const YouLikeTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "YOU LIKE 18 MOVIES",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: MOVIE_BEST_POPULAR_FILMS_AND_SERIALS_COLOR,
          fontSize: TEXT_REGULAR),
    );
  }
}

class ThumbUpIconView extends StatelessWidget {
  const ThumbUpIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.thumb_up,
      color: Colors.amber,
      size: THUMB_UP_ICON_SIZE,
    );
  }
}

class FavoriteIconView extends StatelessWidget {
  const FavoriteIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border_rounded,
      color: Colors.white,
      size: FAVORITE_ICON_SIZE,
    );
  }
}

class BestActorsImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL9DwpKwL6WkO3BSCCtDa71Cv0GfVt0TXTdAfTXDV86fwWJ184A6O2VzMY43UsrsWl5dU&usqp=CAU",
        fit: BoxFit.cover,
      ),
    );
  }
}
