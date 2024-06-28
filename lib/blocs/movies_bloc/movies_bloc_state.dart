part of 'movies_bloc_bloc.dart';

class MoviesBlocState extends Equatable {
  const MoviesBlocState();

  @override
  List<Object> get props => [];
}

class MoviesBlocInitial extends MoviesBlocState {}

class MoviesBlocLoading extends MoviesBlocState {}

class MoviesBlocError extends MoviesBlocState {}

class MoviesBlocSuccess extends MoviesBlocState {
  final Movie moviePage;
  final bool isSearch;

  const MoviesBlocSuccess({required this.moviePage, required this.isSearch});
  @override
  List<Object> get props => [moviePage, isSearch];
}
