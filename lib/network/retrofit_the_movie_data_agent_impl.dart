import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:movie_flutter/network/movie_data_agent.dart';
import 'package:movie_flutter/network/retrofit_the_movie_api.dart';

class RetrofitTheMovieDataAgentImpl extends MovieDataAgent {
  late TheMovieApi mApi;

  RetrofitTheMovieDataAgentImpl() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  @override
  void getNowPlayingMovie(int page) {
    mApi
        .getNowPlayingMovie(apiKeyValue, languageEnUsValue, page.toString())
        .then((value) => {debugPrint("Now Playing ===> ${value.toString()}")})
        .catchError((error) {
      debugPrint("Error ===> ${error.toString()}");
    });
  }
}
