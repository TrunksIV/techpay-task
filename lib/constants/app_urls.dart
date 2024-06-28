const String baseUrl = "https://api.themoviedb.org/3";

class AppUrls {
  // All Movies
  static const String dicoverUrl =
      "$baseUrl/discover/*?include_adult=*&include_video=*&language=en-US&page=*&sort_by=popularity.desc";

  static const String searcMoviesUrl = "$baseUrl/search/movie?query=*";

// Movies Genres Url
  static const String movieGenresUrl = "$baseUrl/genre/movie/list?language=en";
}
