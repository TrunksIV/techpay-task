import 'dart:developer';

import 'package:http/http.dart';
import 'package:movies/models/query-params/discover.dart';
import 'package:movies/utils/http_utils.dart';

import '../constants/app_urls.dart';
import '../constants/status_codes.dart';
import '../utils/url_utils.dart';

class MoviesProvider {
  MoviesProvider();

  Future<String> fetchMovies(DiscoverParams params) async {
    String url = UrlUtils.parseUrl(AppUrls.dicoverUrl, [
      "${params.genreName}",
      "${params.isAdult}",
      "${params.includeVideo}",
      "${params.page}"
    ]);

    if (params.genreId != null) {
      url = '$url&with_genres=${params.genreId}';
    }
    var response = await HttpUtils.get(Uri.parse(url), Client());

    if (response.statusCode != StatusCode.success) {
      throw Exception("Error getting movies");
    }

    return response.body;
  }

  Future<String> searchMovies(String query) async {
    String url = UrlUtils.parseUrl(AppUrls.searcMoviesUrl, [
      "$query",
    ]);

    var response = await HttpUtils.get(Uri.parse(url), Client());

    if (response.statusCode != StatusCode.success) {
      throw Exception("Error getting movies");
    }

    return response.body;
  }

  Future<String> fetchMovieGenres() async {
    var response =
        await HttpUtils.get(Uri.parse(AppUrls.movieGenresUrl), Client());

    if (response.statusCode != StatusCode.success) {
      throw Exception("Error getting movies genres");
    }

    return response.body;
  }
}
