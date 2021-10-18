
import 'package:movie_flutter/data_vos/data/movie_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>> getNowPlayingMovie(int page);
}
