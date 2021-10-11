import 'package:flutter/material.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/widgets/title_text.dart';

class ShowCasesView extends StatelessWidget {
  const ShowCasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SHOWCASES_WIDTH,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Stack(
        children: [
          Positioned.fill(
            child: ShowcasesImageView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ShowcasesTitleView(),
          ),
        ],
      ),
    );
  }
}

class ShowcasesTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Passengers",
            style: TextStyle(
              fontSize: TEXT_REGULAR_3X,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          TitleText("15 DECEMBER 2016"),
        ],
      ),
    );
  }
}

class ShowcasesImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.nme.com/wp-content/uploads/2021/07/wolverine-hugh-jackman.jpg",
      fit: BoxFit.cover,
    );
  }
}
