part of 'movies_genres_bloc.dart';

sealed class MoviesGenresState extends Equatable {
  const MoviesGenresState();

  @override
  List<Object> get props => [];
}

final class MoviesGenresInitial extends MoviesGenresState {}

final class MoviesGenresLoading extends MoviesGenresState {}

final class MoviesGenresError extends MoviesGenresState {}

final class MoviesGenresSuccess extends MoviesGenresState {
  final MovieGenres data;

  const MoviesGenresSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
