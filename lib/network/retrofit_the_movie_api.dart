import 'package:dio/dio.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:movie_flutter/network/responses/get_now_playing_response.dart';
import 'package:retrofit/http.dart';
part 'retrofit_the_movie_api.g.dart';

@RestApi(baseUrl: baseUrlDio)
abstract class RetrofitTheMovieApi {
  factory RetrofitTheMovieApi(Dio dio) = _RetrofitTheMovieApi;

  @GET(endPoint)
  Future<GetNowPlayingResponse>getNowPlayingMovie(
    @Query(paramAPIKey) String paramAPIKey,
    @Query(paramLanguage) String paramLanguage,
    @Query(paramPage) String paramPage,
  );
}
