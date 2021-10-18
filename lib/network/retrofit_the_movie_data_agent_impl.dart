import 'package:dio/dio.dart';
import 'package:movie_flutter/data_vos/data/movie_vo.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:movie_flutter/network/movie_data_agent.dart';
import 'package:movie_flutter/network/retrofit_the_movie_api.dart';

class RetrofitTheMovieDataAgentImpl extends MovieDataAgent {
  late RetrofitTheMovieApi mApi;

  // /// to initialize mApi ,so created
  // RetrofitTheMovieDataAgentImpl() {
  //   final dio = Dio();
  //   mApi = RetrofitTheMovieApi(dio);
  // }

  static final RetrofitTheMovieDataAgentImpl _singleton =
      RetrofitTheMovieDataAgentImpl._internal();

  factory RetrofitTheMovieDataAgentImpl() {
    return _singleton;
  }

  RetrofitTheMovieDataAgentImpl._internal() {
    final dio = Dio();
    mApi = RetrofitTheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovie(int page) {
    return mApi
        .getNowPlayingMovie(apiKeyValue, languageEnUsValue, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }
}
