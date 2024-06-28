class DiscoverParams {
  String? genreName;
  bool? isAdult;
  bool? includeVideo;
  final int page;
  int? genreId;

  DiscoverParams(
      {required this.genreName,
      required this.page,
      required this.includeVideo,
      required this.isAdult,
      this.genreId});
}
