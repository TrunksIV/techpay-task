import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/models/query-params/discover.dart';
import 'package:movies/repositories/movies_repository.dart';

import '../../models/movies/movie.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

class MoviesBlocBloc extends Bloc<MoviesBlocEvent, MoviesBlocState> {
  final MoviesRepository repository;
  MoviesBlocBloc({
    required this.repository,
  }) : super(MoviesBlocInitial()) {
    // Load All Movies and Filtering
    on<LoadMovies>((event, emit) async {
      try {
        emit(MoviesBlocLoading());
        var response = await repository.getMovies(event.params);
        emit(MoviesBlocSuccess(moviePage: response, isSearch: false));
      } catch (e) {
        emit(MoviesBlocError());
      }
    });

// Serach Event
    on<SearchMovies>((event, emit) async {
      try {
        emit(MoviesBlocLoading());
        var response = await repository.filterMovies(event.query);
        emit(MoviesBlocSuccess(moviePage: response, isSearch: true));
      } catch (e) {
        emit(MoviesBlocError());
      }
    });
  }
}
