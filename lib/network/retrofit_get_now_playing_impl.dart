import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:movie_flutter/network/retrofit_the_movie_api.dart';

import 'movie_data_agent.dart';

class RetrofitGetNowPlayingImpl extends MovieDataAgent {
  late RetrofitTheMovieApi mApi;

  RetrofitGetNowPlayingImpl() {
    final dio = Dio();
    mApi = RetrofitTheMovieApi(dio);
  }

  @override
  void getNowPlayingMovie(int page) {
    mApi
        .getNowPlayingMovie(apiKeyValue, languageEnUsValue, page.toString())
        .then((response) => {
              response.results.forEach((movie) {
                debugPrint(movie.toString());
              })
            })
        .catchError((error) {
      debugPrint("Error ===> ${error.toString()}");
    });
  }
}
