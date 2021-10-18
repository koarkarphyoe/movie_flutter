import 'package:movie_flutter/data_vos/data/movie_vo.dart';
import 'package:movie_flutter/data_vos/models/movie_model.dart';
import 'package:movie_flutter/network/movie_data_agent.dart';
import 'package:movie_flutter/network/retrofit_the_movie_data_agent_impl.dart';

class MovieModelImpl extends MovieModel {
  /// declared dependencie like a variable!
  MovieDataAgent mDataAgent = RetrofitTheMovieDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();
  factory MovieModelImpl() {
    return _singleton;
  }
  MovieModelImpl._internal();

  @override
  Future<List<MovieVO>> getNowPlayingMovie(int page) {
    return mDataAgent.getNowPlayingMovie(page);
  }
}
