import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/colors.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/widgets/gradient_view.dart';
import 'package:movie_flutter/widgets/star_rating_bar.dart';
import 'package:movie_flutter/widgets/title_text.dart';

class MovieDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APP_BAR_COLOR,
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: BACKGROUND_COLOR,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: MovieDetailsImageView(),
                    ),
                    Positioned.fill(
                      child: GradientView(),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: MARGIN_MEDIUM_LARGE, left: MARGIN_MEDIUM_3),
                        child: MovieDetailsBackButtonView(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: MARGIN_MEDIUM_LARGE, right: MARGIN_MEDIUM_3),
                        child: MovieDetailsSearchView(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: MARGIN_MEDIUM_2,
                            bottom: MARGIN_MEDIUM_2,
                            right: MARGIN_MEDIUM_2),
                        child: MovieDetailsAppBarInfoView(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsAppBarInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              //need to write padding ,if not circular color text will not appear
              padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
              ),
              height: MARGIN_MEDIUM_XLARGE,
              decoration: BoxDecoration(
                color: PLAY_BUTTON_COLOR,
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM_XXXLARGE),
              ),
              child: Center(
                child: Text(
                  "2016",
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    StarRatingBar(),
                    SizedBox(height:MARGIN_SMALL),
                    TitleText("38876 VOTES"),
                  ],
                ),
                SizedBox(
                  width: MARGIN_MEDIUM_1,
                ),
                Text(
                  "9,75",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MOVIE_DETAILS_APP_BAR_RATING_TEXT_SIZE),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM_XLARGE),
        MovieDetailsAppBarTitleView(),
      ],
    );
  }
}

class MovieDetailsAppBarTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Fantastic Beasts and Where to Find Them",
      style: TextStyle(
          fontSize: TEXT_REGULAR_3X,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}

class MovieDetailsSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: MOVIE_DETAILS_BACK_BUTTON_SIZE,
      ),
    );
  }
}

class MovieDetailsBackButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: APP_BAR_COLOR, shape: BoxShape.circle),
      child: Icon(
        Icons.chevron_left,
        color: Colors.white,
        size: MOVIE_DETAILS_BACK_BUTTON_SIZE,
      ),
    );
  }
}

class MovieDetailsImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://media.comicbook.com/2021/07/hugh-jackman-wolverine-return-x-men-marvel-1274645-1280x0.jpeg",
      fit: BoxFit.cover,
    );
  }
}
