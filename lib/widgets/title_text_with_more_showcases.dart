import 'package:flutter/material.dart';
import 'package:movie_flutter/widgets/title_text.dart';

import 'more_showcases_text.dart';

class TitleTextWithMoreShowcases extends StatelessWidget {
  final String titleText;
  final String moreTitleText;

  TitleTextWithMoreShowcases(this.titleText,this.moreTitleText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(titleText),
        Spacer(),
        MoreShowCases(moreTitleText),
      ],
    );
  }
}
