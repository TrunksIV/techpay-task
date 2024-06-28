import 'dart:convert';

import 'package:movies/models/movies/movie.dart';
import 'package:movies/models/movies/movie_genres.dart';
import 'package:movies/models/query-params/discover.dart';
import 'package:movies/repositories/movies_provider.dart';

class MoviesRepository {
  MoviesProvider provider;
  MoviesRepository({required this.provider});

  Future<Movie> getMovies(DiscoverParams params) async {
    String data = await provider.fetchMovies(params);
    return Movie.fromJson(jsonDecode(data));
  }

  Future<Movie> filterMovies(String query) async {
    String data = await provider.searchMovies(query);
    return Movie.fromJson(jsonDecode(data));
  }

  Future<MovieGenres> getGenres() async {
    String data = await provider.fetchMovieGenres();
    return MovieGenres.fromJson(jsonDecode(data));
  }
}
