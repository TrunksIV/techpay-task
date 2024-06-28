part of 'movies_search_cubit.dart';

sealed class MoviesSearchState extends Equatable {
  const MoviesSearchState();

  @override
  List<Object> get props => [];
}

final class MoviesSearchInitial extends MoviesSearchState {}
