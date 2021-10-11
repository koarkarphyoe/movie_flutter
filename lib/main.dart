import 'package:flutter/material.dart';
import 'package:movie_flutter/network/http_movie_data_agent_impl.dart';
import 'package:movie_flutter/pages/home_page.dart';

import 'pages/movie_details_screen.dart';

void main() {
  HttpMovieDataAgentImpl().getNowPlayingMovie(1);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieDetailsPage(),
    ),
  );
}
