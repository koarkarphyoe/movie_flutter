import 'package:flutter/cupertino.dart';
import 'package:movie_flutter/network/api_constants.dart';
import 'package:movie_flutter/network/movie_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  void getNowPlayingMovie(int page) {
    Map<String, String> queryParameters = {
      paramAPIKey: apiKey,
      paramLanguage: languageEN_Us,
      paramPage: page.toString(),
    };
    var url = Uri.http(baseUrl, endPoint, queryParameters);
    http
        .get(url)
        .then((value) =>
            {debugPrint("Now Playing ====> ${value.body.toString()} ")})
        .catchError((error) {
      debugPrint("Error ===> ${error.toString()}");
    });
  }
}
