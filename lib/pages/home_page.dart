import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter/data_vos/data/movie_vo.dart';
import 'package:movie_flutter/data_vos/models/movie_model.dart';
import 'package:movie_flutter/data_vos/models/movie_model_impl.dart';
import 'package:movie_flutter/resources/colors.dart';
import 'package:movie_flutter/resources/dimens.dart';
import 'package:movie_flutter/resources/strings.dart';
import 'package:movie_flutter/viewitems/banner_view.dart';
import 'package:movie_flutter/viewitems/best_actors_view.dart';
import 'package:movie_flutter/viewitems/movie_view.dart';
import 'package:movie_flutter/viewitems/showcases_view.dart';
import 'package:movie_flutter/widgets/more_showcases_text.dart';
import 'package:movie_flutter/widgets/title_text.dart';
import 'package:movie_flutter/widgets/title_text_with_more_showcases.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> genreList = [
    "Action",
    "Adventure",
    "Horror",
    "Comedy",
    "Thriller",
    "Drama",
  ];

  MovieModel mMovieModel = MovieModelImpl();

  List<MovieVO>? mNowPlayingMovie;

  @override
  void initState() {
    super.initState();

    mMovieModel.getNowPlayingMovie(1).then((movieList) {
      setState(() {
        mNowPlayingMovie = movieList;
      });
    }).catchError((error) {
      debugPrint("Error ===> ${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: APP_BAR_COLOR,
        title: Text(
          APP_BAR_TEXT,
          style: TextStyle(
              fontSize: APP_BAR_TEXT_SIZE,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerSectionView(),
              SizedBox(height: MARGIN_MEDIUM_1),
              BestPopularFilmsAndSerialsSectionView(mNowPlayingMovie),
              SizedBox(height: MARGIN_MEDIUM_1),
              CheckMovieShowtimesSectionView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              GenreSectionView(genreList: genreList),
              SizedBox(height: MARGIN_MEDIUM_1),
              ShowcasesSectionView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              BestActorsSectionView(),
              SizedBox(height: MARGIN_MEDIUM_1),
            ],
          ),
        ),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  
  final List<String> genreList;

  const GenreSectionView({
    required this.genreList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: genreList.length,
          child: TabBar(
            isScrollable: true,
            indicatorColor: PLAY_BUTTON_COLOR,
            unselectedLabelColor: MOVIE_BEST_POPULAR_FILMS_AND_SERIALS_COLOR,
            tabs: genreList
                .map(
                  (genre) => Tab(
                    child: Text(genre),
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          color: APP_BAR_COLOR,
          padding:
              EdgeInsets.only(top: MARGIN_MEDIUM_1, bottom: MARGIN_MEDIUM_1),
          child: HorizontalMovieListView([]),
        ),
      ],
    );
  }
}

class CheckMovieShowtimesSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: CHECK_MOVIE_SHOWTIMES_HEIGHT,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      color: APP_BAR_COLOR,
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
        child: Row(
          children: [
            CheckMovieShowtimesTitleView(),
            Spacer(),
            CheckMovieShowtimesIconView(),
          ],
        ),
      ),
    );
  }
}

class CheckMovieShowtimesIconView extends StatelessWidget {
  const CheckMovieShowtimesIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_on_rounded,
      color: Colors.white,
      size: LOCATION_ICON_SIZE,
    );
  }
}

class CheckMovieShowtimesTitleView extends StatelessWidget {
  const CheckMovieShowtimesTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Check Movie \nShowtimes",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: CHECK_MOVIE_SHOWTIMES_TEXT),
        ),
        Spacer(),
        MoreShowCases("SEE MORE", textColor: PLAY_BUTTON_COLOR),
      ],
    );
  }
}

class BestActorsSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: APP_BAR_COLOR,
      padding:
          const EdgeInsets.only(top: MARGIN_MEDIUM_1, bottom: MARGIN_MEDIUM_1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithMoreShowcases(BEST_ACTORS, MORE_ACTORS),
          ),
          Container(
            padding:
                EdgeInsets.only(top: MARGIN_MEDIUM_1, bottom: MARGIN_MEDIUM_1),
            height: BEST_ACTORS_VIEW_HEIGHT,
            child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: [
                BestActorsView(),
                BestActorsView(),
                BestActorsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowcasesSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithMoreShowcases(
                SHOW_CASES_TEXT, MORE_SHOW_CASES_TEXT),
          ),
          SizedBox(height: MARGIN_MEDIUM_1),
          Container(
            height: SHOWCASES_HEIGHT,
            child: ListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              children: [
                ShowCasesView(),
                ShowCasesView(),
                ShowCasesView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestPopularFilmsAndSerialsSectionView extends StatelessWidget {
  final List<MovieVO>? mMovie;

  BestPopularFilmsAndSerialsSectionView(this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(BEST_POPULAR_FILMS_AND_SERIALS_TEXT),
        ),
        SizedBox(height: MARGIN_MEDIUM_1),
        Container(
            color: APP_BAR_COLOR,
            padding:
                EdgeInsets.only(top: MARGIN_MEDIUM_1, bottom: MARGIN_MEDIUM_1),
            child: HorizontalMovieListView(mMovie)),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final List<MovieVO>? mMovie;

  HorizontalMovieListView(this.mMovie);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: APP_BAR_COLOR,
      height: MOVIE_VIEW_HEIGHT,
      child: ListView.builder(
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        scrollDirection: Axis.horizontal,
        itemCount: mMovie?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return MovieView(mMovie?[index]);
        },
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: [
              BannerView(),
              BannerView(),
              BannerView(),
            ],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_1),
        DotsIndicator(
          dotsCount: 3,
          position: _position,
          decorator: DotsDecorator(
              activeColor: PLAY_BUTTON_COLOR,
              color: DOTS_INDICATOR_INACTIVE_COLOR),
        ),
      ],
    );
  }
}
