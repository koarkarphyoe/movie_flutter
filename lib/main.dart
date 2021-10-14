import 'package:flutter/material.dart';
import 'package:movie_flutter/network/dio_movie_data_agent_impl.dart';
import 'package:movie_flutter/network/http_movie_data_agent_impl.dart';
import 'package:movie_flutter/network/retrofit_get_now_playing_impl.dart';
import 'package:movie_flutter/pages/home_page.dart';

import 'pages/movie_details_screen.dart';

void main() {
  /// This is the first Flutter Project!
  RetrofitGetNowPlayingImpl().getNowPlayingMovie(1);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieDetailsPage(),
    ),
  );
}
