import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/colors.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/widgets/gradient_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(),
        ),
      ],
    );
  }
}

class PlayButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.play_circle_fill,
      color: PLAY_BUTTON_COLOR,
      size: PLAY_BUTTON_SIZE,
    );
  }
}


class BannerTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The Wolverine 2013.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TEXT_REGULAR_3X,
                color: Colors.white),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "Official Review.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TEXT_REGULAR_3X,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
        "https://www.nme.com/wp-content/uploads/2021/07/wolverine-hugh-jackman.jpg",
        fit: BoxFit.cover);
  }
}
