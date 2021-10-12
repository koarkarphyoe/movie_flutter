import 'package:dio/dio.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:retrofit/http.dart';
part 'retrofit_the_movie_api.g.dart';

@RestApi(baseUrl: baseUrlDio)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;
  
  @GET(endPoint)
  Future getNowPlayingMovie(
    @Query(paramAPIKey) String paramAPIKey,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );
}
