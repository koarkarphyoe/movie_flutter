// import 'package:flutter/cupertino.dart';
// import 'package:movie_flutter/network/api_constants.dart';
// import 'package:movie_flutter/network/movie_data_agent.dart';
// import 'package:http/http.dart' as http;

// class HttpMovieDataAgentImpl extends MovieDataAgent {
//   @override
//   void getNowPlayingMovie(int page) {
//     Map<String, String> queryParameters = {
//       paramAPIKey: apiKeyValue,
//       paramLanguage: languageEnUsValue,
//       paramPage: page.toString(),
//     };
//     var url = Uri.http(baseUrlHttp, endPoint, queryParameters);
//     http
//         .get(url)
//         .then((value) =>
//             {debugPrint("Now Playing ====> ${value.body.toString()} ")})
//         .catchError((error) {
//       debugPrint("Error ===> ${error.toString()}");
//     });
//   }
// }
