part of 'movies_bloc_bloc.dart';

class MoviesBlocEvent extends Equatable {
  const MoviesBlocEvent();
  @override
  List<Object> get props => [];
}

class LoadMovies extends MoviesBlocEvent {
  final DiscoverParams params;

  const LoadMovies({required this.params});
  @override
  List<Object> get props => [params];
}

class SearchMovies extends MoviesBlocEvent {
  final String query;

  const SearchMovies({required this.query});
  @override
  List<Object> get props => [query];
}
