// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:movie_flutter/network/api_constants.dart';
// import 'package:movie_flutter/network/movie_data_agent.dart';

// class DioMovieDataAgentImpl extends MovieDataAgent {
//   @override
//   void getNowPlayingMovie(int page) {
//     Map<String, String> queryParameters = {
//       paramAPIKey: apiKeyValue,
//       paramLanguage: languageEnUsValue,
//       paramPage: page.toString(),
//     };

//     Dio()
//         .get("$baseUrlDio$endPoint", queryParameters: queryParameters)
//         .then((value) => {debugPrint("Now Playing ===> ${value.toString()}")})
//         .catchError((error) {
//       debugPrint("Error ===> ${error.toString()}");
//     });
//   }
// }
